#!/bin/bash
set -e

apt update && export DEBIAN_FRONTEND=noninteractive \
  && apt -y install --no-install-recommends \
  curl gnupg locales zsh wget fonts-powerline fontconfig make procps curl file gcc g++ screen tmux

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh
