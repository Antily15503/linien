import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
import random

# dummy_SweepCSR is generated with step_shift=24 (see gateware/migen_to_verilog.py,
# matching real usage in gateware/linien_module.py). The internal accumulator runs
# at 2**STEP_SHIFT times the resolution of the 14-bit output y, so `step` here is
# in units of "y counts per clock cycle" and gets pre-shifted before being written
# to the DUT's raw step register (see tests/test_simple_autolock_fpga.py for the
# same convention).
STEP_SHIFT = 24


async def set_min_max(dut, min, max):
    dut.min.value = min
    dut.max.value = max


async def set_step(dut, step):
    dut.step.value = step << STEP_SHIFT
    pass


# simulates a ttl pulse
# i.e, clear goes high for a set number of clock cycles, stopping the sweep
async def ttl_pulse(dut, clk_cycles):
    dut.sequence_stop.value = 1
    await ClockCycles(dut.clk, clk_cycles)
    dut.sequence_stop.value = 0


# sets the sweep to run
async def run(dut):
    dut.run.value = 1
    dut.hold.value = 0
    dut.clear.value = 0


@cocotb.test()
async def simple_test(dut):
    clock = Clock(dut.clk, 8, unit="ns")
    cocotb.start_soon(clock.start())

    # initial values
    dut.run.value = 0
    dut.step.value = 0
    dut.hold.value = 0
    dut.clear.value = 0
    dut.pause.value = 0
    dut.x.value = 0
    dut.rst.value = 0

    # trigger reset
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 0

    for i in range(10):
        # step register is 30 bits wide, so the pre-shift value must stay
        # below 2**30 / 2**STEP_SHIFT = 64.
        step = random.randint(1, 60)
        min = random.randint(-8000, -500)
        max = random.randint(500, 8000)

        await set_step(dut, step)
        await set_min_max(dut, min, max)
        await run(dut)
        await ClockCycles(dut.clk, 5000)
        for j in range(random.randint(1, 10)):
            await ttl_pulse(dut, random.randint(100, 1000))
        pass
        await ClockCycles(dut.clk, 1000)
