#!/bin/bash
apt update && export DEBIAN_FRONTEND=noninteractive \
  && apt -y install --no-install-recommends \
  curl git-core gnupg locales zsh wget fonts-powerline fontconfig \
  g++ make glibc-source build-essential procps curl file

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh
