#!/bin/zsh

pushd $NXE_SCRIPTS # safely execute scripts from /tmp/scripts

  # these scripts will run silently as background processes until finished
  mkdir -p $NXE_SCRIPTS
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/.angular'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/.config'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/apps'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/bin'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/dist'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/libs'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/node_modules'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &
  nohup `sudo chown -R ${USERNAME} '${NXE_WS}/tools'` >> `${NXE_SCRIPTS}/permissions.out` 2>&1 &

popd
