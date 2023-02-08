#!/bin/zsh

pushd /tmp # safely execute scripts from /tmp/scripts

  # these scripts will run silently as background processes until finished
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/.devcontainer"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/.vscode"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/.angular"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/.config"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/apps"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/bin"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/dist"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/libs"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/node_modules"` >> "${NXE_HOME}/nxe.log" 2>&1 &
  nohup `sudo chown -R ${USERNAME}:${USERNAME} "${NXE_WS}/tools"` >> "${NXE_HOME}/nxe.log" 2>&1 &

popd
