#!/bin/bash

pushd /tmp # safely execute scripts from /tmp/scripts
echo "Started running: scripts/init-postStart-base.sh"

# supervisor
supervisord -d

# scripts
source $NXE_SCRIPTS/nxe-post-permissions.zsh      # update permissions on each start

# shell
source $NXE_SHELL/nxe-shell-autocomplete.zsh      # import default zsh autocomplete shell enhancements

## optional things
# source "${NXE_SCRIPTS}/nxe-post-dapr-cli.zsh" && echo "Sourced ${NXE_SCRIPTS}/nxe-post-dapr-cli.zsh"
# source "${NXE_SCRIPTS}/nxe-post-node-packages.zsh" # node stuff

# cleanup any orphaned k3s nodes
tmux new -d 'exec $NXE_SCRIPTS/nxe-post-k3s-nohup.zsh |& tee -a /tmp/nxe-k3s-nohup.log'

# make sure mounts occur
source $NXE_SCRIPTS/nxe-post-k3s-cilium-nohup.zsh


echo "Finished running: scripts/init-postStart-base.sh"
popd
