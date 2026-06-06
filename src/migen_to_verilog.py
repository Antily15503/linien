from migen import *
from migen.fhdl.verilog import convert
from misoc.interconnect.csr import AutoCSR, CSRStorage, CSRStatus
from regfile_adapter import RegFileAdapter
import os, sys
from pathlib import Path

ABS_PATH = "~/school_files/spring2026/ECE554/linien_554/gateware/logic"

sys.path.append(os.path.expanduser(ABS_PATH))

from ttl_handler import TTLHandler
from sequence import SequenceExecutor

m = SequenceExecutor()
convert(m).write("sequence.v")
