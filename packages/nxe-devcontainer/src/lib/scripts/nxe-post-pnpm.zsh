#!/bin/bash
pushd /tmp # safely execute scripts from /tmp/scripts

# curl -fsSL https://get.pnpm.io/install.sh | sh -
# install if any of these commands fail
npm install -g pnpm@latest npm@latest

popd
