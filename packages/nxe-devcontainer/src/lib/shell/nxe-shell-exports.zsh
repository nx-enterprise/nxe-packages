#!/bin/zsh

export ZSH=$HOME/.oh-my-zsh
export PATH="${PATH}:${NXE_WS}/bin:${NXE_WS}/node_modules/.bin:${NXE_WS}/.config/dapr/bin"
export KUBECONFIG="${NXE_WS}/.config/persist/kubeconfig.yaml"
#export NUGET_PACKAGES=/home/vscode/.nuget/packages
