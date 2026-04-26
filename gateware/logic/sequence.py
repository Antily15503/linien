from migen import Module, Signal, Instance, Cat
from misoc.interconnect.csr import AutoCSR, CSRStorage, CSRStatus
from migen import ClockSignal, ResetSignal

from .ttl_handler import TTLHandler


class SequenceExecutor(Module, AutoCSR):
    """
    Migen wrapper around sequence_top.sv (sequence executor) + ttl_handler.

    CSRs are packed into a small number of wide registers so each register
    needs only one wishbone write-strobe. Per-CSR write strobes block slice
    packing in Vivado (each CSR's CE differs), so collapsing them improves
    LUT/slice utilization at the cost of a one-time server-side rewrite of
    csrmap.py / registers.py to use the packed names and bit layouts below.

    The TTLHandler watches the GPIO pin, snapshots linien state on a rising
    edge, and fires a one-cycle start pulse into the SystemVerilog FSM. Its
    o_active holds high until the SV FSM signals o_seq_done, keeping
    pid_pause asserted across the whole sequence (including the FSM's DONE
    state, which drops its own o_active).
    """

    def __init__(
        self,
        width=14,
        signal_width=25,
        data_width=32,
        max_blocks=16,
        fsm_addr_width=8,
        awg_addr_width=10,
    ):
        block_idx_width = max(1, (max_blocks - 1).bit_length())

        # Packed write CSRs. Each `.re` pulses for one cycle on a wishbone
        # write, so a single PS write per CSR atomically loads addr+data and
        # latches the regfile - replaced the old write-addr / write-data /
        # set-wen / clear-wen 4-step process.

        # control: [0]=arm, [1+block_idx_width-1:1]=num_blocks
        self.control = CSRStorage(1 + block_idx_width)

        # fsm_write: [data_width-1:0]=data, [data_width+fsm_addr_width-1:data_width]=addr; .re = wen
        self.fsm_write = CSRStorage(data_width + fsm_addr_width)

        # awg_write: [width-1:0]=data, [width+awg_addr_width-1:width]=addr; .re = wen
        self.awg_write = CSRStorage(width + awg_addr_width)

        # Packed read-only snapshot. Layout (LSB first):
        #   [1:0]                                              = status (active, armed)
        #   [2 + width - 1 : 2]                                = saved_pid_out
        #   [2 + width + signal_width - 1 : 2 + width]         = saved_integrator
        #   [2 + 2*width + signal_width - 1 : 2 + width + signal_width] = saved_sweep_pos
        #   [2 + 3*width + signal_width - 1 : 2 + 2*width + signal_width] = saved_dac_out
        snapshot_width = 2 + 3 * width + signal_width
        self.snapshot = CSRStatus(snapshot_width)

        # Unpacked field aliases
        arm = self.control.storage[0]
        num_blocks = self.control.storage[1:1 + block_idx_width]

        fsm_w_data = self.fsm_write.storage[:data_width]
        fsm_w_addr = self.fsm_write.storage[data_width:]
        fsm_w_en = self.fsm_write.re

        awg_w_data = self.awg_write.storage[:width]
        awg_w_addr = self.awg_write.storage[width:]
        awg_w_en = self.awg_write.re

        # Signals exposed to LinienModule (interface unchanged)
        self.dac_out = Signal((width, True))
        self.ttl_in = Signal()
        self.pid_pause = Signal()
        self.active = Signal()
        self.seq_done = Signal()

        self.linien_pid_out = Signal((width, True))
        self.linien_integrator = Signal((signal_width, True))
        self.linien_sweep_pos = Signal((width, True))
        self.linien_dac_out = Signal((width, True))

        self.submodules.ttl = ttl = TTLHandler()

        o_dac_drive = Signal(width)

        self.comb += [
            ttl.i_ttl.eq(self.ttl_in),
            ttl.i_enable.eq(arm),
            ttl.i_seq_done.eq(self.seq_done),
            ttl.i_linien_pid_out.eq(self.linien_pid_out),
            ttl.i_linien_integrator.eq(self.linien_integrator),
            ttl.i_linien_sweep_pos.eq(self.linien_sweep_pos),
            ttl.i_linien_dac_out.eq(self.linien_dac_out),

            self.active.eq(ttl.o_active),
            self.pid_pause.eq(ttl.o_active),
            self.dac_out.eq(o_dac_drive),

            self.snapshot.status.eq(Cat(
                ttl.o_status,
                ttl.o_saved_pid_out,
                ttl.o_saved_integrator,
                ttl.o_saved_sweep_pos,
                ttl.o_saved_dac_out,
            )),
        ]

        self.specials += Instance(
            "sequence_top",
            p_MAX_BLOCKS=max_blocks,
            p_DATA_WIDTH=data_width,
            p_V_DATA_WIDTH=width,
            p_NUM_BLOCK_TYPES=6,
            p_FSM_REGFILE_ADDR_WIDTH=fsm_addr_width,
            p_AWG_REGFILE_ADDR_WIDTH=awg_addr_width,
            i_clk=ClockSignal(),
            i_rst_n=~ResetSignal(),
            i_i_fsm_reg_w_addr=fsm_w_addr,
            i_i_fsm_reg_w_data=fsm_w_data,
            i_i_fsm_reg_w_en=fsm_w_en,
            i_i_awg_reg_w_addr=awg_w_addr,
            i_i_awg_reg_w_data=awg_w_data,
            i_i_awg_reg_w_en=awg_w_en,
            i_i_num_blocks=num_blocks,
            i_i_start=ttl.o_fsm_start,
            i_i_init_v=ttl.o_saved_dac_out,
            o_o_seq_done=self.seq_done,
            o_o_active=Signal(),
            o_o_dac_drive=o_dac_drive,
        )
