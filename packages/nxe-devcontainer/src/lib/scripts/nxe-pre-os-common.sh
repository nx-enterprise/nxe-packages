#!/bin/bash
set -e

apt update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  curl gnupg locales zsh wget fonts-powerline fontconfig make procps curl file gcc g++ screen tmux \
  kmod libncurses5-dev python3-bpfcc flex bison libelf-dev bc libssl-dev vim

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh
