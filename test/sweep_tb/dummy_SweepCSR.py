# module meant to mimic sweepCSR without actually using CSR's, for testing purposes.

import os
import sys

# gateware/logic/limit.py is only importable as part of the `gateware` package,
# so put the project root (two levels up) on sys.path.
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from migen import Cat, If, Module, Signal
from gateware.logic.limit import Limit
from gateware.logic.sweep import Sweep


class dummy_SweepCSR(Module):
    def __init__(self, width, step_width=None, step_shift=0):
        self.x = Signal((width, True), name="x")
        self.y = Signal((width, True), name="y")

        self.hold = Signal(name="hold")
        self.clear = Signal(name="clear")

        # step_shift is used to increase the sweep's width to allow for slower sweeps,
        # i.e. smaller steps.
        self.step_shift = step_shift
        if step_width is None:
            step_width = width

        self.step = Signal(step_width, name="step")
        self.min = Signal((width, True), name="min")
        self.max = Signal((width, True), name="max")
        self.run = Signal(1, name="run")
        self.pause = Signal(1, name="pause")
        self.sequence_stop = Signal(name="sequence_stop")

        ###

        # Add sweep module with (optionally) increased width.
        self.submodules.sweep = Sweep(width + self.step_shift + 1)
        self.submodules.limit = Limit(width + 1)

        self.comb += [
            self.sweep.run.eq(~self.clear & self.run),
            self.sweep.hold.eq(self.hold),
            self.sweep.sequence_stop.eq(self.sequence_stop),
            # Shifting the output of the sweep back to its actual width.
            self.limit.x.eq(self.sweep.y >> self.step_shift),
            self.sweep.step.eq(self.step),
            self.sweep.max.eq(self.max << self.step_shift),
            self.sweep.min.eq(self.min << self.step_shift),
        ]
        self.sync += [
            self.limit.min.eq(Cat(self.min, self.min[-1])),
            self.limit.max.eq(Cat(self.max, self.max[-1])),
            self.sweep.turn.eq(self.limit.railed),
            If(
                self.pause,
                self.y.eq(0),
            ).Else(self.y.eq(self.limit.y)),
        ]
        pass
