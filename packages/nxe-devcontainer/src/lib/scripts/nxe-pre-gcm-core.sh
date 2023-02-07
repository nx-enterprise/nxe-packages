#!/bin/bash
pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

curl -LO https://aka.ms/gcm/linux-install-source.sh
bash ./linux-install-source.sh -y
git-credential-manager-core configure
rm ./linux-install-source.sh
rm -Rf git-credential-manager

source $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
