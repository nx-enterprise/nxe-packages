#!/bin/bash
set -e

# starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh
