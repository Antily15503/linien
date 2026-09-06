# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

.PHONY: all 

all : dummy_SweepCSR.sv
	$(MAKE) sim
# defaults
SIM ?= icarus
WAVES?=1
# FST ?= -fst # Use more efficient FST format # Doesn't seen to be working
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../../src

CUR_DIR = $(CURDIR)

# Generating sweep.sv requires migen/misoc, which live in the project's
# .venv, not in the pyenv `cocotb` environment that this Makefile is meant
# to be invoked from (via cocotb-config below). Use the venv's python
# explicitly so this works regardless of which env is currently active.
MIGEN_PYTHON = $(abspath $(CUR_DIR)/../../.venv/bin/python)

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

dummy_SweepCSR.sv: ../../gateware/logic/sweep.py ../../gateware/migen_to_verilog.py
	cd ../.. && $(MIGEN_PYTHON) -m gateware.migen_to_verilog dummy_SweepCSR && mv dummy_SweepCSR.sv $(CUR_DIR)

# `cocotb-config` and the python3 invocations inside cocotb's own makefiles
# are pyenv shims. This project's .python-version pins pyenv to a version
# used for the main venv/migen tooling (not cocotb), so unqualified shim
# calls fail to resolve. Force pyenv to resolve against the `cocotb-env`
# pyenv-virtualenv for this whole invocation, and export it so it also
# applies to recipe subprocesses spawned once Makefile.sim is included below.
export PYENV_VERSION := cocotb-env

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

waves:
	surfer $(TOPLEVEL).vcd &
