#!/usr/bin/env bash

#script to update the server-side linien to use the forked version of linien
#i.e, need to update the gateware, csrmap, server.py, registers.py, parameters.py and communication.py
#as well as linien_common

set -e

if [ gateware/linien_module.py -nt linien-server/linien_server/gateware.bin ]; then
  echo "WARNING: linien_module.py is newer than gateware.bin - rebuild needed!"
  exit 1
fi

PITAYA="root@rp-f0edf0.local"
REMOTE="/usr/local/lib/python3.10/dist-packages/linien_server/"
REMOTE_COMMON="/usr/local/lib/python3.10/dist-packages/linien_common/"
DEPLOY_MARKER="$(dirname "$0")/.last_deploy"

echo "deploying on to $PITAYA"

# Ask the board where the packages actually live; the dist-packages path varies
# with the Red Pitaya OS image's python version.

echo "Stopping server..."

# tolerate a server that isn't currently running
ssh $PITAYA "linien-server stop" || true

echo "Copying Files ..."

FILES_TO_SYNC=(
  "linien-server/linien_server/gateware.bin:$REMOTE/"
  "linien-server/linien_server/autolock/sequence_relock.py:$REMOTE/autolock/"
  "linien-server/linien_server/acquisition.py:$REMOTE/"
  "linien-server/linien_server/csrmap.py:$REMOTE/"
  "linien-server/linien_server/server.py:$REMOTE/"
  "linien-server/linien_server/registers.py:$REMOTE/"
  "linien-server/linien_server/parameters.py:$REMOTE/"
  "linien-common/linien_common/communication.py:$REMOTE_COMMON/"
)

for entry in "${FILES_TO_SYNC[@]}"; do
  local_path="${entry%%:*}"
  remote_dir="${entry#*:}"
  if [ ! -f "$DEPLOY_MARKER" ] || [ "$local_path" -nt "$DEPLOY_MARKER" ]; then
    echo "  copying $local_path"
    scp "$local_path" "$PITAYA:$remote_dir"
  else
    echo "  skipping $local_path (unchanged)"
  fi
done

echo "starting server"
ssh $PITAYA "linien-server start"

touch "$DEPLOY_MARKER"

echo "done"
