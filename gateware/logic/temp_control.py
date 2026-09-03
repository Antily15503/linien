from migen import ClockSignal, Instance, Module, ResetSignal, Signal
from misoc.interconnect.csr import AutoCSR, CSRStatus, CSRStorage


class TempControl(Module, AutoCSR):
    """
    Migen wrapper around temp_pwm.sv + temp_sampler.sv.

    Slow temperature loop for the PZT setup. The gateware does two things: it
    drives the heater MOSFET with a 30.5 kHz PWM whose duty comes from a CSR,
    and it publishes one averaged sample of the PZT control signal per entry
    into linien's PID state. The loop itself runs on the PS
    (ps_programs/temp_control_pwm.py), which polls the sample and writes duty.
    """

    def __init__(self, width=14):
        # Written by the PS temperature loop. Reset 0 means the heater is off
        # between bitstream load and the first PS write.
        self.duty = CSRStorage(12, reset=0)

        # 14 integer + 4 fractional bits, signed. The CSR bus is unsigned, so
        # the PS sign-extends from bit 17 -- same convention as the sequence
        # snapshot registers.
        self.sample_data = CSRStatus(18)

        # Separate register, not packed into the top of sample_data, so the PS
        # can read it in one atomic bus transaction. misoc's CSRStatus does NOT
        # latch multi-byte reads (see misoc/interconnect/csr.py: "the atomicity
        # of reads is not guaranteed"), so the 3-byte sample_data read can
        # straddle a gateware update. The PS guards it with a seqlock: read
        # count, read data, read count again, retry if it moved.
        self.sample_count = CSRStatus(8)

        # fabric ports
        self.control_in = Signal((width, True))  # PZT control signal
        self.pid_active = Signal()               # linien is in the PID state
        self.pwm_o = Signal()                    # to the heater MOSFET gate

        ###

        sample = Signal((18, True))
        count = Signal(8)

        self.specials += Instance(
            "temp_pwm",
            i_clk_i=ClockSignal(),
            i_rst_i=ResetSignal("sys"),
            i_duty_i=self.duty.storage,
            o_pwm_o=self.pwm_o,
        )

        self.specials += Instance(
            "temp_sampler",
            p_DELAY_CLKS=250000,  # 2 ms at 125 MHz
            p_WINDOW_LOG2=16,     # 65536 clk = 524.3 us
            p_FRAC_BITS=4,
            i_clk_i=ClockSignal(),
            i_rst_i=ResetSignal("sys"),
            i_pid_active_i=self.pid_active,
            i_control_i=self.control_in,
            o_sample_o=sample,
            o_count_o=count,
        )

        self.comb += [
            self.sample_data.status.eq(sample),
            self.sample_count.status.eq(count),
        ]
