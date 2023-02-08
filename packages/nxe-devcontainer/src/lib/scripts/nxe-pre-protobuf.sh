#!/bin/bash
pushd /tmp # safely execute scripts from /tmp/scripts

# install protobuf
sudo apt update --allow-insecure-repositories
sudo apt install -y protobuf-compiler

# Substitute BIN for your bin directory.
# Substitute VERSION for the current released version.
BIN="${NXE_BIN}"
VERSION="1.13.1"
curl -sSL \
  "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m)" \
  -o "${BIN}/buf"
chmod +x "${BIN}/buf"

source $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
