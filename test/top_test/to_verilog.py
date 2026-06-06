from pathlib import Path
import sys
from migen import *
from migen.fhdl.verilog import convert
from misoc.interconnect.csr import AutoCSR, CSRStorage, CSRStatus


print(sys.path)
