"""
ttl_handler.py - TTL interrupt handler for the Guns 'n Lasers sequence system

watches a GPIO pin for a rising edge. on trigger:
  - loads linien's CSR values into internal snapshot CSRs (transparent load)
  - waits one cycle for values to settle (guards against same-cycle CSR update)
  - pulses o_fsm_start (one cycle) to kick off the sequence FSM
  - asserts o_active (level) for the entire sequence duration
  - holds until i_seq_done, then returns to idle

latency: 5 cycles from TTL edge to o_fsm_start pulse (sync 2 + edge 1 + SNAPSHOT 1 + TRIGGER 1).

this is a straight copy of src/ttl_handler.py, re-homed under gateware/logic/ so
SequenceExecutor can instantiate it as a migen submodule.
"""

"""
NEW TTL_HANDLER IMPLEMENTATION (MULTIPLE TTL_SIGNALS)

watches 4 GPIO pins for a rising edge. on detection: 
    -load liniens CSR values into the internal snapshot 
    - waits one cycle for values to settle 
    - pulse o_fsm_start to start the fsm sequence
    - 4 bit wide o_active now dictates what the block_idx should be
    - hold until i_seq_done is asserted, then return to idle. 
"""

from migen import Cat, FSM, If, Module, NextState, NextValue, Signal


DAC_WIDTH = 14
INTEGRATOR_WIDTH = 25
SWEEP_WIDTH = 14


class TTLHandler(Module):
    def __init__(self):
        # inputs
        self.i_ttl = Signal(4, name="i_ttl")
        self.i_enable = Signal(4, name="i_enable")

        # TODO: new feature
        # can these CSR's be removed by introducing logic to freeze the
        # reading/updating of the signals?
        self.i_linien_pid_out = Signal((DAC_WIDTH, True), name="i_linien_pid_out")
        self.i_linien_integrator = Signal(
            (INTEGRATOR_WIDTH, True), name="i_linien_integrator"
        )
        self.i_linien_sweep_pos = Signal((SWEEP_WIDTH, True), name="i_linien_sweep_pos")
        self.i_linien_dac_out = Signal((DAC_WIDTH, True), name="i_linien_dac_out")

        self.i_seq_done = Signal(name="i_seq_done")

        # outputs
        self.o_fsm_start = Signal(name="o_fsm_start")
        # change o_active to be a 4 wide signal such that the control.sv can
        # determine whcih offset to begin at
        self.o_active = Signal(4, name="o_active")
        self.o_status_1 = Signal(2, name="o_status")
        self.o_status_2 = Signal(2, name="o_status")
        self.o_status_3 = Signal(2, name="o_status")
        self.o_status_4 = Signal(2, name="o_status")

        self.o_saved_pid_out = Signal((DAC_WIDTH, True), name="o_saved_pid_out")
        self.o_saved_integrator = Signal(
            (INTEGRATOR_WIDTH, True), name="o_saved_integrator"
        )
        self.o_saved_sweep_pos = Signal((SWEEP_WIDTH, True), name="o_saved_sweep_pos")
        self.o_saved_dac_out = Signal((DAC_WIDTH, True), name="o_saved_dac_out")

        # two-flop synchronizer
        ttl_sync0 = Signal(4)
        ttl_sync1 = Signal(4)
        ttl_prev = Signal(4)

        self.sync += [
            ttl_sync0.eq(self.i_ttl),
            ttl_sync1.eq(ttl_sync0),
            ttl_prev.eq(ttl_sync1),
        ]

        rising_edge = Signal(4)
        armed = Signal(4)

        self.comb += [
            rising_edge.eq(ttl_sync1 & ~ttl_prev),
            # armed signal is equal to... enabling a specific
            armed.eq(self.i_enable & ~self.o_active),
        ]

        # if multiple signals are detected, use a **priority encoder setup**
        # i.e, the lowest index (0) takes priority over all else, same for 1,2,3
        priority_rising_edge = Signal(4)
        self.comb += [
            # default case
            priority_rising_edge.eq(0),
            If(rising_edge[0], priority_rising_edge.eq(0b0001))
            .Elif(rising_edge[1], priority_rising_edge.eq(0b0010))
            .Elif(rising_edge[2], priority_rising_edge.eq(0b0100))
            .Elif(rising_edge[3], priority_rising_edge.eq(0b1000)),
        ]

        self.submodules.fsm = fsm = FSM(reset_state="IDLE")

        # let o_active be the or of all the active signals, and additionally define
        # 4 more o_actives corresponding to which ttl signal is actually active.
        # makes it easier to feed into the control.sv to combinationally determine the
        # block base addr instead of needing to flop the pulse from the i_ttl and
        # using that instead?
        # actually, treat this as a latch that gets reset in the idle state

        self.o_active_offset = Signal(4)

        fsm.act(
            "IDLE",
            self.o_active.eq(0),
            self.o_fsm_start.eq(0),
            self.o_active_offset.eq(0),
            If(
                armed
                & (rising_edge[0] | rising_edge[1] | rising_edge[2] | rising_edge[3]),
                NextState("SNAPSHOT"),
                # additionally, latch the rising edge profile?
                NextValue(self.o_active_offset, priority_rising_edge),
            ),
        )

        fsm.act(
            "SNAPSHOT",
            self.o_active.eq(0),
            self.o_fsm_start.eq(0),
            NextValue(self.o_saved_pid_out, self.i_linien_pid_out),
            NextValue(self.o_saved_integrator, self.i_linien_integrator),
            NextValue(self.o_saved_sweep_pos, self.i_linien_sweep_pos),
            NextValue(self.o_saved_dac_out, self.i_linien_dac_out),
            NextState("TRIGGER"),
        )

        fsm.act(
            "TRIGGER",
            self.o_active.eq(self.o_active_offset),
            self.o_fsm_start.eq(1),
            NextState("ACTIVE"),
        )

        fsm.act(
            "ACTIVE",
            self.o_active.eq(self.o_active_offset),
            self.o_fsm_start.eq(0),
            If(
                self.i_seq_done,
                NextState("IDLE"),
                NextValue(self.o_active_offset, 0000),
            ),
        )

        self.comb += self.o_status_1.eq(Cat(self.o_active_offset[0], armed[0]))
        self.comb += self.o_status_2.eq(Cat(self.o_active_offset[1], armed[1]))
        self.comb += self.o_status_3.eq(Cat(self.o_active_offset[2], armed[2]))
        self.comb += self.o_status_4.eq(Cat(self.o_active_offset[3], armed[3]))
