import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles


def from_signed14(val):
    # convert a value to signed 14 bits
    val = val & 0x3FFF
    if val & 0x200:
        val -= 0x4000
    return val


def to_14bit(val):
    return val & 0x3FFF


# for convenience sake, make all actions that can be "given" to the DUT as functions?
# method use to load instructions into the instruction memory
async def load_inst():
    pass


async def reset():
    pass


async def load_awg():
    pass
