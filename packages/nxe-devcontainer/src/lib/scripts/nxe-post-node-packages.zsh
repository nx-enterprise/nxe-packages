#!/bin/zsh

pushd $NXE_WS

export PUPPETEER_SKIP_DOWNLOAD=true
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PYTHONUNBUFFERED=1

pnpm -g add pnpm@latest npm@latest env-cmd nx rimraf prettier
corepack prepare pnpm@latest --activate

popd
