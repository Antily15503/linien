import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
import random

V_MIN = 0x3FFF
V_MAX = 0x1FFF

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


# helper to sign-extend a 14-bit value to Python int
def from_signed14(val):
    val = val & 0x3FFF
    if val & 0x2000:  # sign bit set
        val -= 0x4000
    return val


def to_14bit(val):
    return val & 0x3FFF


# FUNCTIONS TO TRANSLATE VOLTAGE TO VALUE IN RANGE OF 8191 to -8192 SIGNED
def volts_to_bits(volt):
    if volt > 0:
        return int((volt / VP) / GAIN * DAC_COUNTS - 1)
    return int((volt / VP) / GAIN * DAC_COUNTS)


async def load_param(dut, addr, data):
    dut.en.value = 1
    dut.i_param_addr.value = addr
    dut.i_param_data.value = data
    await RisingEdge(dut.clk)
    dut.en.value = 0


async def reset(dut):
    dut.rst_n.value = 0
    dut.en.value = 0
    dut.i_param_addr.value = 0
    dut.i_param_data.value = 0
    dut.i_active.value = 0
    await ClockCycles(dut.clk, 2)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)


async def run_ramp(dut, v_start, v_step, clk_div, num_steps):
    """
    Loads params, activates block, collects output samples, deactivates.
    Returns list of observed v_drive values.
    """
    await load_param(dut, 0, to_14bit(v_start))
    await load_param(dut, 1, to_14bit(v_step))
    await load_param(dut, 2, to_14bit(clk_div))

    samples = []
    dut.i_active.value = 1

    for _ in range(num_steps):
        await RisingEdge(dut.clk)
        samples.append(from_signed14(dut.v_drive.value.integer))

    dut.i_active.value = 0
    await ClockCycles(dut.clk, 2)
    return samples


"""
@cocotb.test()
async def test_1(dut):
    cocotb.log.info("test 1 commencing")
    clock = Clock(dut.clk, 8, units="ns")
    cocotb.start_soon(clock.start())
    await reset(dut)
    # run a series of random ramps, holding for the same amount of time
    for i in range(10):
        v_start = random.randint(0, V_MAX)
        v_step = random.randint(0x000, 0x0100)
        clk_div = random.randint(10, 100)
        num_steps = 2000
        await run_ramp(dut, v_start, v_step, clk_div, num_steps)

"""


# test specifically for negative ramps
@cocotb.test()
async def test_2(dut):
    cocotb.log.info("test 1 commencing")
    clock = Clock(dut.clk, 8, units="ns")
    cocotb.start_soon(clock.start())
    await reset(dut)
    # run a series of random ramps, holding for the same amount of time
    for i in range(10):
        v_start = volts_to_bits(random.randint(-1, 1))
        v_step = volts_to_bits(random.uniform(-0.1, 0.1))
        clk_div = random.randint(10, 100)
        num_steps = 2000
        await run_ramp(dut, v_start, v_step, clk_div, num_steps)
