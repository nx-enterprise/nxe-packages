#!/bin/bash

pushd /tmp # safely execute scripts from /tmp/scripts
echo "Started running: scripts/init-postStart-base.sh"

# scripts
source "${NXE_SCRIPTS}/nxe-post-permissions.zsh"      # update permissions on each start

# shell
source "${NXE_SHELL}/nxe-shell-autocomplete.zsh"      # import default zsh autocomplete shell enhancements

## optional things
# source "${NXE_SCRIPTS}/nxe-post-dapr-cli.zsh" && echo "Sourced ${NXE_SCRIPTS}/nxe-post-dapr-cli.zsh"
# source "${NXE_SCRIPTS}/nxe-post-node-packages.zsh" # node stuff
# source "${NXE_SHELL}/nxe-shell-k8s.zsh"      # import k8s kubeconfig and zsh autocomplete shell enhancements


echo "Finished running: scripts/init-postStart-base.sh"
popd
