#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

# cleanup stuff
sudo apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/*

popd
