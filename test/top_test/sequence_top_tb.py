import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge
from cocotb.triggers import FallingEdge
from cocotb.triggers import Timer
from cocotb.triggers import First

# helper functions to act similarly to the real shit
CLOCK_FREQ = 125e6
CLOCK_PER = 1 / CLOCK_FREQ
VPP = 2
VP = 1.1
DAC_COUNTS = 8192
# vout=gain*v_dac
# vout/gain=v_dac
GAIN = 5
V_MAX = VPP / 2
V_MIN = -VPP / 2


# FUNCTIONS TO TRANSLATE FROM TIME TO CYCLES
def us_to_clock(time):
    return time * (10 ** (-6)) * CLOCK_FREQ


def ms_to_clock(time):
    return int(time * (10 ** (-3)) * CLOCK_FREQ)


def s_to_clock(time):
    return time * CLOCK_FREQ


# FUNCTIONS TO TRANSLATE VOLTAGE TO VALUE IN RANGE OF 8191 to -8192 SIGNED
def volts_to_bits(volt):
    if volt > 0:
        return int((volt / VP) / GAIN * DAC_COUNTS - 1)
    return int((volt / VP) / GAIN * DAC_COUNTS)


# recall that this is the format data is given to the thing.

#    client.parameters.sequence_blocks.value = [
#        {"type": 0, "params": [0, ms_to_clock(3)]},
#        {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(5)]},
#        {"type": 0, "params": [volts_to_bits(jump_1), ms_to_clock(130)]},
#        {
#            "type": 1,
#            "params": [volts_to_bits(-1.25), 1, int(33333 * ramp), ms_to_clock(12)],
#        },
#        {"type": 0, "params": [0, ms_to_clock(3)]},
#    ]

# i.e, instructions should be provided as a list of dictionaries.


# method to write a sequence of instructions to 1 of the 4 sequences.

# stand-in for CSR registers to hold number of blocks.
num_blocks = [0, 0, 0, 0]


#
async def write_sinusoid_reg(dut, index, value):
    # initially, set all values to 0
    dut.sinusoid_reg_addr.value = 0
    dut.sinusoid_reg_data.value = 0
    dut.sinusoid_en.value = 0
    dut.sinusoid_active.value = 0

    # wait a couple of clock cycles.
    await ClockCycles(dut.clk, 4)
    dut.sinusoid_reg_addr.value = index
    dut.sinusoid_reg_data.value = value
    dut.sinusoid_en.value = 1
    dut.sinusoid_active.value = 0

    await ClockCycles(dut.clk, 4)

    dut.sinusoid_reg_addr.value = 0
    dut.sinusoid_reg_data.value = 0
    dut.sinusoid_en.value = 0
    dut.sinusoid_active.value = 0
    pass


async def activate_sinusoid(dut):
    dut.sinusoid_en.value = 0
    dut.sinusoid_active.value = 1
    pass


async def deactivate_sinusoid(dut):
    dut.sinusoid_en.value = 0
    dut.sinusoid_active.value = 0
    pass


async def write_inst_reg(dut, index, instructions):
    # initially set all the values to defualt.
    stride = 8
    dut.rst_n.value = 1
    # initial base address should be the index provided
    base_addr = (index - 1) << 7
    dut.i_fsm_reg_w_addr.value = 0b000000000
    dut.i_fsm_reg_w_en.value = 0
    dut.i_fsm_reg_w_data.value = 0

    # for each instruction, maintain the address, set w_en high for a cycle, then low
    for inst in instructions:
        # set the base address
        dut.i_fsm_reg_w_addr.value = base_addr
        dut.i_fsm_reg_w_data.value = inst["en_sin"]
        # pulse w_en
        dut.i_fsm_reg_w_en.value = 1
        # just test with 3 rising edges.
        await ClockCycles(dut.clk, 1)
        dut.i_fsm_reg_w_en.value = 0

        dut.i_fsm_reg_w_addr.value = base_addr + 1
        dut.i_fsm_reg_w_data.value = inst["type"]

        dut.i_fsm_reg_w_en.value = 1
        # just test with 3 rising edges.
        await ClockCycles(dut.clk, 1)
        dut.i_fsm_reg_w_en.value = 0

        # now for the parameters
        for i, params in enumerate(inst["params"]):
            dut.i_fsm_reg_w_addr.value = base_addr + 2 + i
            dut.i_fsm_reg_w_data.value = params
            dut.i_fsm_reg_w_en.value = 1
            await ClockCycles(dut.clk, 1)
            dut.i_fsm_reg_w_en.value = 0
        # after finishing the instruction, increment the base address.
        base_addr += stride
    num_blocks[index - 1] = len(instructions) - 1


# recall that to execute...
# one cycle pulse to i_start
# i_active for offset
# i_num_blocks for number of blocks in the instruction.
# wait until you recieve the o_seq_done signal
async def execute(dut, index, en_sinusoid):
    # provide correct index and number of block.
    dut.i_active.value = 1 << (index - 1)
    dut.i_num_blocks.value = num_blocks[index - 1]
    # initial value of start
    dut.i_start.value = 0

    if en_sinusoid:
        await activate_sinusoid(dut)
    else:
        await deactivate_sinusoid(dut)
    # hold constant for a bit
    await ClockCycles(dut.clk, 3)
    # assert high for 1 clock cycle
    dut.i_start.value = 1
    await ClockCycles(dut.clk, 1)
    dut.i_start.value = 0


# first test sequence, checking to see if original functionality still works.
@cocotb.test()
async def test1(dut):
    # log stuff
    cocotb.log.info("test 1")
    # generate the clock
    clock = Clock(dut.clk, 8, unit="ns")
    start_clock = cocotb.start_soon(clock.start())

    # initial conditions; reset, etc.
    dut.rst_n.value = 0
    dut.i_fsm_reg_w_addr.value = 0
    dut.i_fsm_reg_w_data.value = 0
    dut.i_fsm_reg_w_en.value = 0
    dut.i_awg_reg_w_addr.value = 0
    dut.i_awg_reg_w_data.value = 0
    dut.i_awg_reg_w_en.value = 0
    dut.i_num_blocks.value = 0
    dut.i_start.value = 0
    dut.i_init_v.value = volts_to_bits(1)
    dut.i_active.value = 0
    await ClockCycles(dut.clk, 3)
    dut.rst_n.value = 1

    #
    instructions_1 = [
        {"en_sin": 0, "type": 0, "params": [0, 100]},
        {"en_sin": 0, "type": 2, "params": [volts_to_bits(1), 200]},
        {"en_sin": 0, "type": 0, "params": [volts_to_bits(0), 100]},
        {
            "en_sin": 0,
            "type": 1,
            "params": [5000, -5, 5, 500],
        },
    ]

    #
    instructions_2 = [
        {
            "en_sin": 0,
            "type": 1,
            "params": [5000, -5, 5, 500],
        },
        {
            "en_sin": 0,
            "type": 1,
            "params": [0, 5, 1, 500],
        },
        {
            "en_sin": 1,
            "type": 1,
            "params": [0, 10, 1, 500],
        },
    ]

    #
    instructions_3 = [
        {"en_sin": 0, "type": 0, "params": [0, 100]},
        {"en_sin": 1, "type": 2, "params": [volts_to_bits(1), 200]},
        {"en_sin": 0, "type": 0, "params": [volts_to_bits(0.5), 100]},
        {"en_sin": 1, "type": 2, "params": [volts_to_bits(0.2), 100]},
        {"en_sin": 0, "type": 0, "params": [volts_to_bits(0.8), 100]},
    ]

    # write some default values to the sinusoid
    await write_sinusoid_reg(dut, 0, volts_to_bits(0))
    await write_sinusoid_reg(dut, 1, volts_to_bits(1))
    await write_sinusoid_reg(dut, 2, volts_to_bits(-2))
    await write_sinusoid_reg(dut, 3, volts_to_bits(2))
    await write_sinusoid_reg(dut, 4, 10000000)

    # for testing, try and activate it by itself?
    await activate_sinusoid(dut)
    await ClockCycles(dut.clk, 10000)

    await write_inst_reg(dut, 1, instructions_1)
    await write_inst_reg(dut, 2, instructions_2)
    await write_inst_reg(dut, 3, instructions_3)
    await execute(dut, 1, True)
    await RisingEdge(dut.o_seq_done)
    await execute(dut, 2, True)
    await RisingEdge(dut.o_seq_done)
    await execute(dut, 3, True)
    await RisingEdge(dut.o_seq_done)
    await execute(dut, 3, True)
    await RisingEdge(dut.o_seq_done)
    await execute(dut, 2, True)
    await RisingEdge(dut.o_seq_done)
    await execute(dut, 1, True)
    await RisingEdge(dut.o_seq_done)
