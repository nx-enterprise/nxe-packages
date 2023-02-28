#!/bin/zsh
#set -e
if [ -e $NXE_WS_DEVCONTAINER/persist/kubeconfig.yaml ]; then sed -i 's/240.0.0.250/nxe-k3s-server/' "${NXE_WS_DEVCONTAINER}/persist/kubeconfig.yaml"; else echo "Does not exist"; fi
