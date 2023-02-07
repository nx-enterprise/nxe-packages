#!/bin/bash
pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

curl -fsSL https://get.pnpm.io/install.sh | sh -
# install if any of these commands fail
#pnpm add -g npm@latest env-cmd nx rimraf prettier
corepack prepare pnpm@latest --activate

source $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
