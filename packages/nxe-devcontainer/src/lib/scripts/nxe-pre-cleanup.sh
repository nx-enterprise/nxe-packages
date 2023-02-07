#!/bin/bash
pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

# cleanup stuff
sudo apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/scripts/

popd
