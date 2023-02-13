#!/bin/zsh

# this file is initialized after the container is built
# su vscode -c 'xxx' 2>&1
set -e

# required to run this at startup
source $NXE_SCRIPTS/init-postCreate-base.sh && echo "Sourced ${NXE_SCRIPTS}/init-postCreate-base.sh"

# optionally, run your own
# source "${NXE_SCRIPTS}/nxe-pre-protobuf.sh" && echo "Sourced ${NXE_SCRIPTS}/nxe-pre-protobuf.sh"

#dapr uninstall --all && dapr init

# Run custom scripts as root

# pushd $NXE_WS
# sudo chown -R $USERNAME:$USERNAME $(ls -I node_modules) && echo "Set ${USERNAME} user as owner of: ${NXE_WS}"
# popd

# Notifiy that we're done this script
echo "NXE Done: postCreateCommand"
