import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import RisingEdge
from cocotb.triggers import FallingEdge
from cocotb.triggers import Timer
from cocotb.triggers import First

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


def volts_to_bits(volt):
    if volt > 0:
        return int((volt / VP) / GAIN * DAC_COUNTS - 1)
    return int((volt / VP) / GAIN * DAC_COUNTS)


# method to load in values into the DUT.
async def load(dut, address, data):
    dut.i_param_addr.value = address
    dut.i_param_data.value = data
    dut.i_en.value = 1
    await RisingEdge(dut.clk)

    # after rising edge, de-assert
    dut.i_en.value = 0


async def rand_load_and_run(dut):
    # set initial conditions
    dut.i_active.value = 0
    dut.i_en.value = 0
    await ClockCycles(dut.clk, 3)

    # sequentially load in value
    await load(dut, 0, random.randint(-8192, 8191))
    await load(dut, 1, random.randint(0, 8191))
    await load(dut, 2, random.randint(-8192, 0))
    await load(dut, 3, random.randint(0, 8191))
    await load(
        dut,
        4,
        random.randint(int((1 / 125e6) * (2**32)), int((10000 / 125e6) * (2**32))),
    )

    # after loading all the values, set enable back to low an activate it for some
    # amount of time
    dut.i_active.value = 1

    await ClockCycles(dut.clk, 100000)


def freq_to_phase(f_hz, f_clk_hz):
    return int(round(f_hz / f_clk_hz * (1 << 32)))


@cocotb.test()
async def test1(dut):
    cocotb.log.info("test 1")
    dut.rst_n.value = 0
    dut.i_en.value = 0
    dut.i_active.value = 0
    # clock period should be 8ns, equivalent to 125 mHz
    clock = Clock(dut.clk, 8, unit="ns")

    start_clock = cocotb.start_soon(clock.start())
    await ClockCycles(dut.clk, 2)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)

    await load(dut, 0, 0)
    await load(dut, 0x01, volts_to_bits(1))
    await load(dut, 0x02, -8192)
    await load(dut, 0x03, volts_to_bits(2))

    for i in range(1, 7):
        await load(dut, 0x04, freq_to_phase(i * 10**3, 125 * 10**6))
        dut.i_active.value = 1
        await ClockCycles(dut.clk, 500000)
        dut.i_active.value = 0
        pass
