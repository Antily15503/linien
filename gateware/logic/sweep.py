# This file is part of Linien and based on redpid.
#
# Copyright (C) 2016-2024 Linien Authors (https://github.com/linien-org/linien#license)
#
# Linien is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Linien is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Linien.  If not, see <http://www.gnu.org/licenses/>.

from migen import Cat, If, Module, Signal
from misoc.interconnect.csr import AutoCSR, CSRStorage

from .limit import Limit

# modified sweep such that on exiting ttl_active (given by sequence_stop), restart the sweep from the top


class Sweep(Module):
    def __init__(self, width):
        self.run = Signal(name="run")
        self.step = Signal(width - 1, name="step")
        self.turn = Signal(name="turn")
        self.hold = Signal(name="hold")
        self.y = Signal((width, True), name="y")
        self.trigger = Signal(name="trigger")
        self.sequence_stop = Signal(name="sequence_stop")
        self.sequence_stop_reg = Signal(name="sequence_stop_reg")
        self.max = Signal(width, name="max")
        self.min = Signal(width, name="min")
        ###

        self.up = Signal(name="up")
        turning = Signal(name="turning")
        dir = Signal(name="dir")

        self.comb += [
            If(
                (self.run),
                If(self.turn & ~turning, self.up.eq(~dir)).Else(self.up.eq(dir)),
            ).Else(self.up.eq(1))
        ]
        self.sync += [
            # ONLY TRIGGERS ON RAILED (max or min) AND RISING
            self.sequence_stop_reg.eq(self.sequence_stop),
            self.trigger.eq(
                (self.turn & self.up) | (~self.sequence_stop & self.sequence_stop_reg)
            ),
            turning.eq(self.turn),
            If(self.sequence_stop, dir.eq(0)).Else(dir.eq(self.up)),
            If(self.sequence_stop, (self.y.eq(self.max)))
            .Elif((~self.run), self.y.eq(0))
            .Elif(
                ~self.hold,
                If(
                    self.up,
                    self.y.eq(self.y + self.step),
                ).Else(
                    self.y.eq(self.y - self.step),
                ),
            ),
        ]


class SweepCSR(Module, AutoCSR):
    def __init__(self, width, step_width=None, step_shift=0):
        self.x = Signal((width, True))
        self.y = Signal((width, True))

        self.hold = Signal()
        self.clear = Signal()

        # step_shift is used to increase the sweep's width to allow for slower sweeps,
        # i.e. smaller steps.
        self.step_shift = step_shift
        if step_width is None:
            step_width = width

        self.step = CSRStorage(step_width)
        self.min = CSRStorage(width, reset=1 << (width - 1))
        self.max = CSRStorage(width, reset=(1 << (width - 1)) - 1)
        self.run = CSRStorage(1)
        self.pause = CSRStorage(1)

        ###

        # Add sweep module with (optionally) increased width.
        self.submodules.sweep = Sweep(width + self.step_shift + 1)
        self.submodules.limit = Limit(width + 1)

        self.comb += [
            self.sweep.run.eq(~self.clear & self.run.storage),
            self.sweep.hold.eq(self.hold),
            # Shifting the output of the sweep back to its actual width.
            self.limit.x.eq(self.sweep.y >> self.step_shift),
            self.sweep.step.eq(self.step.storage),
            self.sweep.max.eq(self.max.storage),
            self.sweep.min.eq(self.min.storage),
        ]
        self.sync += [
            self.limit.min.eq(Cat(self.min.storage, self.min.storage[-1])),
            self.limit.max.eq(Cat(self.max.storage, self.max.storage[-1])),
            self.sweep.turn.eq(self.limit.railed),
            If(
                self.pause.storage,
                self.y.eq(0),
            ).Else(self.y.eq(self.limit.y)),
        ]
