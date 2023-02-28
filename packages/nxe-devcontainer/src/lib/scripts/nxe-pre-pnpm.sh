#!/bin/bash
#set -e

pushd /tmp # safely execute scripts from /tmp/scripts

export PNPM_HOME=$NXE_WS/node_modules/.pnpm
export PATH="$PNPM_HOME:$PATH"
mkdir -p $NXE_WS/node_modules/.pnpm && chown -R $USERNAME:$USERNAME $NXE_WS/node_modules/.pnpm

curl -fsSL https://get.pnpm.io/install.sh | sh -
# install if any of these commands fail
# npm install -g pnpm@latest npm@latest

popd
