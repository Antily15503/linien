#!/bin/bash
set -e

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
LINIENPATH=$SCRIPTPATH/../
MIGENPATH=~/migen
MISOCPATH=~/misoc
cd $SCRIPTPATH/../

export PYTHONPATH=$PYTHONPATH:$LINIENPATH:$LINIENPATH/linien-common:$LINIENPATH/linien-server:$LINIENPATH/src:$LINIENPATH/gateware:$MIGENPATH
export PYTHONPATH=$PYTHONPATH:$MISOCPATH

#VIVADOPATH=~/xilinx/Vivado/2020.2/bin
#VIVADOPATH=~/Vivado/2020.2/bin
#VIVADOPATH=~/Applications/2025.2/Vivado/bin/
# Override from the environment to build on a different machine, e.g.
#   VIVADOPATH=~/Applications/2025.2/Vivado/bin ./gateware/build_fpga_image.sh
VIVADOPATH=${VIVADOPATH:-/c/AMDDesignTools/2025.2/Vivado/bin}
if [ ! -d $VIVADOPATH ]; then
  echo "vivado path $VIVADOPATH does not exist. Please adapt it in build_fpga_image.sh"
  exit 1
fi

export PATH=$VIVADOPATH:$PATH

# `python3` is not usable under Git Bash on Windows: it resolves to the
# Microsoft Store stub, and the conda env ships only python.exe. PYTHON must
# point at an interpreter that has migen and misoc importable -- on Linux that
# is usually just `python3`, so override it there.
PYTHON=${PYTHON:-/c/Users/tejas/miniconda3/envs/linien/python.exe}
if ! "$PYTHON" -c "import migen, misoc" 2>/dev/null; then
  echo "\"$PYTHON\" cannot import migen and misoc."
  echo "Set PYTHON to an interpreter that can, e.g. PYTHON=python3 $0"
  exit 1
fi

rm linien-server/linien_server/gateware.bin -f
# run with -m option to avoid errors related to relative imports without breaking pytest
"$PYTHON" -m gateware.fpga_image_helper
