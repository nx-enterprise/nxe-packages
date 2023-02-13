#!/bin/zsh

pushd /tmp

# Install Dapr to our workspaces' bin folder
wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash > /dev/null 2>&1
dapr init --slim

# remove old config
sudo rm -rf $NXE_HOME/.dapr/components/ $NXE_HOME/.dapr/config.yaml
mkdir -p $NXE_HOME/.dapr/components

ln -s $NXE_DAPR/config.yaml $NXE_HOME/.dapr/config.yaml
ln -s $NXE_DAPR/components/pubsub.yaml  $NXE_HOME/.dapr/components/pubsub.yaml
ln -s $NXE_DAPR/components/statestore.yaml  $NXE_HOME/.dapr/components/statestore.yaml

popd

