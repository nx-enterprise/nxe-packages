#!/bin/zsh

pushd $NXE_SCRIPTS

# remove old config
rm -rf "${NXE_HOME}/.dapr/components/" "${NXE_HOME}/.dapr/config.yaml"
mkdir -p "${NXE_HOME}/.dapr/components"

ln -s "${NXE_WS_DEVCONTAINER}/dapr/config.yaml" "${NXE_HOME}/.dapr/config.yaml"
ln -s "${NXE_WS_DEVCONTAINER}/dapr/components/pubsub.yaml"  "${NXE_HOME}/.dapr/components/pubsub.yaml"
ln -s "${NXE_WS_DEVCONTAINER}/dapr/components/statestore.yaml"  "${NXE_HOME}/.dapr/components/statestore.yaml"

# Install Dapr to our workspaces' bin folder
wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
dapr install --slim

source $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd

