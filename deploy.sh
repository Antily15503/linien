#!/usr/bin/env bash

#script to update the server-side linien to use the forked version of linien
#i.e, need to update the gateware, csrmap, server.py, registers.py, parameters.py and communication.py
#as well as linien_common

set -e

if [ gateware/linien_module.py -nt linien-server/linien_server/gateware.bin ]; then
    echo "WARNING: linien_module.py is newer than gateware.bin - rebuild needed!"
    exit 1
fi
# Board to deploy to. Override for a different board with:
#   PITAYA=root@rp-xxxxxx.local bash deploy.sh
PITAYA="${PITAYA:-root@rp-f0f7e4.local}"

echo "deploying on to $PITAYA"

# Ask the board where the packages actually live; the dist-packages path varies
# with the Red Pitaya OS image's python version.
REMOTE=$(ssh $PITAYA "python3 -c 'import linien_server,os;print(os.path.dirname(linien_server.__file__))'") || {
    echo "ERROR: linien_server not importable on $PITAYA."
    echo "Install it first (see README), then re-run this script."
    exit 1
}
REMOTE_COMMON=$(ssh $PITAYA "python3 -c 'import linien_common,os;print(os.path.dirname(linien_common.__file__))'")
echo "  linien_server -> $REMOTE"
echo "  linien_common -> $REMOTE_COMMON"

echo "Stopping server..."

# tolerate a server that isn't currently running
ssh $PITAYA "linien-server stop" || true

echo "Copying Files ..."
scp linien-server/linien_server/gateware.bin $PITAYA:$REMOTE/
scp linien-server/linien_server/autolock/sequence_relock.py $PITAYA:$REMOTE/autolock/
scp linien-server/linien_server/acquisition.py $PITAYA:$REMOTE/
scp linien-server/linien_server/csrmap.py $PITAYA:$REMOTE/
scp linien-server/linien_server/server.py $PITAYA:$REMOTE/
scp linien-server/linien_server/registers.py $PITAYA:$REMOTE/
scp linien-server/linien_server/parameters.py $PITAYA:$REMOTE/
scp linien-common/linien_common/communication.py $PITAYA:$REMOTE_COMMON/

echo "starting server"
ssh $PITAYA "linien-server start"

echo "done"

