#!/bin/zsh

# this file is initialized after the container is built
# su vscode -c 'xxx' 2>&1
set -ex

source "${NXE_SCRIPTS}/init-post-base.zsh" && echo "Sourced ${NXE_SCRIPTS}/init-post-base.zsh"


#dapr uninstall --all && dapr init

# Run custom scripts as root

# pushd $NXE_WS
# sudo chown -R $USERNAME:$USERNAME $(ls -I node_modules) && echo "Set ${USERNAME} user as owner of: ${NXE_WS}"
# popd

# Notifiy that we're done this script
echo "NXE Done: base/postCreateCommand"
