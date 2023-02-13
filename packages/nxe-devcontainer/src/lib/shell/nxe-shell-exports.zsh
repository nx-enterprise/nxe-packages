#!/bin/zsh

export KUBECONFIG=$NXE_WS_DEVCONTAINER/persist/kubeconfig.yaml
export PATH=$PATH:$NXE_WS/bin:$NXE_HOME/bin:$NXE_WS/node_modules/.bin:$NXE_HOME/.dapr/bin
