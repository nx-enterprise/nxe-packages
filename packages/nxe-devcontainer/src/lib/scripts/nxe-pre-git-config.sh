#!/bin/bash

pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

sudo git config --system --add safe.directory '*'
sudo git config --system credential.useHttpPath true
sudo git config --system core.checkStat minimal
sudo git config --system core.trustctime false
sudo git config --system core.autocrlf input

popd
