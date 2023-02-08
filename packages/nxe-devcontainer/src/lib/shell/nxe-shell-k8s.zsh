#!/bin/zsh

alias k="kubectl"

# get the kubeconfig
export KUBECONFIG=$NXE_WS_DEVCONTAINER/persist/kubeconfig.yaml

# support shell magic
autoload -U +X compinit && compinit
source <(kubectl completion zsh) # magic
source <(helm completion zsh) # magic
