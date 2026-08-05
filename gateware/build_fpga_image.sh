#!/bin/bash
set -e

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
LINIENPATH=$SCRIPTPATH/../
MIGENPATH=~/migen
MISOCPATH=~/misoc
cd $SCRIPTPATH/../

<<<<<<< HEAD
export PYTHONPATH=$PYTHONPATH:$LINIENPATH:$LINIENPATH/linien-common:$LINIENPATH/linien-server:$LINIENPATH/src:$LINIENPATH/gateware:$MIGENPATH
export PYTHONPATH=$PYTHONPATH:$MISOCPATH

#VIVADOPATH=~/xilinx/Vivado/2020.2/bin
#VIVADOPATH=~/Vivado/2020.2/bin
VIVADOPATH=~/Applications/2025.2/Vivado/bin/
=======
#VIVADOPATH=~/xilinx/Vivado/2020.2/bin
VIVADOPATH=~/Vivado/2020.2/bin
#VIVADOPATH=~/Applications/2025.2/2025.2/Vivado/bin/
>>>>>>> gen2-7020-port
if [ ! -d $VIVADOPATH ]; then
  echo "vivado path $VIVADOPATH does not exist. Please adapt it in build_fpga_image.sh"
  exit 1
fi

export PATH=$VIVADOPATH:$PATH

rm linien-server/linien_server/gateware.bin -f
# run with -m option to avoid errors related to relative imports without breaking pytest
python3 -m gateware.fpga_image_helper
