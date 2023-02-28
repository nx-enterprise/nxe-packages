#!/bin/zsh

pushd $NXE_WS

export PUPPETEER_SKIP_DOWNLOAD=true
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PYTHONUNBUFFERED=1

sudo npm install -g node-gyp npm@latest npm@latest env-cmd rimraf prettier

popd
