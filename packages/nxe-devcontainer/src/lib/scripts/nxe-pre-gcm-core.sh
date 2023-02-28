#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

curl -LO https://aka.ms/gcm/linux-install-source.sh
bash ./linux-install-source.sh -y
git-credential-manager-core configure
rm ./linux-install-source.sh
rm -Rf git-credential-manager

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
