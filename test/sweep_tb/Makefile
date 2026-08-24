# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

.PHONY: all 

all : sweep.sv
	$(MAKE) sim
# defaults
SIM ?= icarus
WAVES?=1
# FST ?= -fst # Use more efficient FST format # Doesn't seen to be working
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../../src

CUR_DIR = $(CURDIR)

SIM_BUILD = sim_build/rtl
VERILOG_SOURCES += $(wildcard $(SRC_DIR)/*.sv)
VERILOG_SOURCES += $(wildcard $(CUR_DIR)/*.sv)

# Allow sharing configuration between design and testbench via `include`:
VERILOG_INCLUDE_DIRS += $(SRC_DIR)

# Include the testbench sources:
TOPLEVEL = $(basename $(wildcard *_tb.sv))

$(info TOPLEVEL=$(TOPLEVEL))

# List test modules to run, separated by commas and without the .py suffix:
COCOTB_TEST_MODULES = $(TOPLEVEL)

sweep.sv : ../../gateware/logic/sweep.py ../../gateware/migen_to_verilog.py
	cd ../.. && python -m gateware.migen_to_verilog sweep && mv sweep.sv $(CUR_DIR)

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

waves:
	surfer $(TOPLEVEL).vcd &
