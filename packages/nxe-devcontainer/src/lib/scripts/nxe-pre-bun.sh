#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

su $USERNAME -c 'curl -fsSL https://bun.sh/install | bash'

popd
