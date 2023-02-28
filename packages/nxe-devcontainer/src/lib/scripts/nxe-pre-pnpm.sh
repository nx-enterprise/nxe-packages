#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

curl -fsSL https://get.pnpm.io/install.sh | SHELL=`which bash` bash -
mv /root/.local/share/pnpm/pnpm /usr/local/bin/pnpm && chmod +x /usr/local/bin/pnpm

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
