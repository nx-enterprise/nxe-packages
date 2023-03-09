#!/bin/zsh
#set -e
if [ -e $NXE_WS_DEVCONTAINER/persist/kubeconfig.yaml ]; then sed -i 's/172.20.3.1/172.20.3.1/' "${NXE_WS_DEVCONTAINER}/persist/kubeconfig.yaml"; else echo "Does not exist"; fi
