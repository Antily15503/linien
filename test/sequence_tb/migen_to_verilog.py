import sys
import os

sys.path.append("/home/vedaant/school_files/spring2026/ECE554/linien_554/gateware/logic")
sys.path.append("/home/vedaant/school_files/spring2026/ECE554/linien_554/gateware")

from migen import *
from migen.fhdl.verilog import convert
from sequence import SequenceExecutor

dut = SequenceExecutor()

with open("sequence_executor.v", "w") as f:
    f.write(str(convert(dut, ios={
        dut.ttl_in,
        dut.arm.storage,
        dut.active,
        # ... other top level IOs you want exposed
    })))
