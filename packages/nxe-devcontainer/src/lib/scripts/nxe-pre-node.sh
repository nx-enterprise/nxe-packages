#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

curl -fsSL https://deb.nodesource.com/setup_lts | sudo -E bash -
apt update && export DEBIAN_FRONTEND=noninteractive \
  && apt -y install --no-install-recommends \
  nodejs

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd

