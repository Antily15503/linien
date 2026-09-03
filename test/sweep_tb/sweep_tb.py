import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles
import random


async def set_min_max(dut, min, max):
    dut.min.value = min
    dut.max.value = max


async def set_step(dut, step):
    dut.step.value = step
    pass


# simulates a ttl pulse
# i.e, sequence_stop goes high for a set number of clock cycles
async def ttl_pulse(dut, clk_cycles):
    dut.sequence_stop.value = 1
    await ClockCycles(dut.clk, clk_cycles)
    dut.sequence_stop.value = 0


# sets the sweep to run
async def run(dut):
    dut.run.value = 1
    dut.hold.value = 0
    dut.sequence_stop.value = 0


@cocotb.test()
async def simple_test(dut):
    clock = Clock(dut.clk, 8, unit="ns")
    cocotb.start_soon(clock.start())

    # initial values
    dut.run.value = 0
    dut.step.value = 0
    dut.hold.value = 0
    dut.sequence_stop.value = 0
    dut.rst.value = 0

    # trigger reset
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 0

    await set_step(dut, step=0x00BB)
    await set_min_max(dut, 0x3AAA, 0x0555)
    await run(dut)
    await ClockCycles(dut.clk, 9500)
    await ttl_pulse(dut, 100)
    await ClockCycles(dut.clk, 100)
    await ttl_pulse(dut, 100)
    await set_min_max(dut, 0x2000, 0x1FFF)
    await ClockCycles(dut.clk, 100)
    await ttl_pulse(dut, 100)
    await ClockCycles(dut.clk, 100)
    await ttl_pulse(dut, 100)
    await ClockCycles(dut.clk, 10000)
