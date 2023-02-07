#!/bin/zsh

# on ZSH initial load and when changing directories, see if .zsh_config exists, and if so, source it
function chpwd() {
  if [ -r $PWD/.zsh_config ]; then
    source .zsh_config
  fi
}

if [ -r $PWD/.zsh_config ]; then
  source .zsh_config
fi
