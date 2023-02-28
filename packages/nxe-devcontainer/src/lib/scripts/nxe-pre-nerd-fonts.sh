#!/bin/bash
set -e

pushd /tmp # safely execute scripts from /tmp/scripts

# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d /usr/local/share/fonts/
rm DroidSansMono.zip
fc-cache -fv
echo "done!"

# BitstreamVeraSansMono
# CodeNewRoman
# DroidSansMono
# FiraCode
# FiraMono
# Go-Mono
# Hack
# Hermit
# JetBrainsMono
# Meslo
# Noto
# Overpass
# ProggyClean
# RobotoMono
# SourceCodePro
# SpaceMono
# Ubuntu
# UbuntuMono

exec $NXE_SCRIPTS/nxe-pre-cleanup.sh

popd
