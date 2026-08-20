# simple module to sample and limit photodiode signals for use in peak detection.
# namely removes demodulation inside of chians.py


from migen import Array, Cat, If, Module, Mux, Signal, bits_for
from misoc.interconnect.csr import CSR, AutoCSR, CSRStatus, CSRStorage

from .iir import Iir
from .limit import LimitCSR
from .limit import Limit


# steps
# sample from the ADC
# shift sample to 25 bits from 14 for spacing
# pass through 2 IIR filters
# down shift back to 14 bits
# output
class SimpleChain(Module, AutoCSR):
    def __init__(self, width=14, signal_width=25, coeff_width=18, offset_signal=None):

        # constants
        s = signal_width - width

        # combinational signals
        self.adc = Signal((width, True))
        self.x = Signal((signal_width, True))
        self.iir_1_o = Signal((signal_width, True))
        self.iir_2_o = Signal((signal_width, True))
        self.y = Signal((width, True))

        # sequential signals

        # sample from the ADC
        self.comb += [self.x.eq(self.adc << s)]

        # limit x
        # self.submodules.x_limit = LimitCSR(width=signal_width, guard=1)
        self.submodules.x_limit = Limit(width=signal_width)
        self.comb += [
            self.x_limit.max.eq((1 << (width - 1)) - 1),
            self.x_limit.min.eq((1 << (width))),
        ]

        # iir stages
        self.submodules.iir_1 = Iir(
            order=1, mode="pipelined", width=signal_width, coeff_width=18, shift=16
        )

        self.submodules.iir_2 = Iir(
            order=1, mode="pipelined", width=signal_width, coeff_width=18, shift=16
        )

        # y limit
        self.submodules.y_limit = LimitCSR(width=signal_width, guard=1)

        self.comb += [
            self.x_limit.x.eq(self.x),
            self.iir_1.x.eq(self.x_limit.y),
            self.iir_1_o.eq(self.iir_1.y),
            self.iir_1.hold.eq(0),
            self.iir_1.clear.eq(0),
            self.iir_2.x.eq(self.iir_1.y),
            self.iir_2_o.eq(self.iir_2.y),
            self.iir_2.hold.eq(0),
            self.iir_2.clear.eq(0),
        ]

        self.y_tap = CSRStorage(2)

        # input and output of y_limit depend on which stage is selected
        # y_tap==0; raw ADC signal
        # y_tap==1; iir_1_o
        # y_tap==2; iir_1_o->iir_2_i->iir_2_o
        ys = Array([self.x_limit.y, self.iir_1_o, self.iir_2_o])
        self.comb += [self.y_limit.x.eq(ys[self.y_tap.storage])]
        self.comb += [self.y.eq(self.y_limit.y)]
