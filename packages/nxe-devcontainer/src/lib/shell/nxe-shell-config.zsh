#!/bin/zsh

export ZSH_CACHE_DIR=$ZSH/cache
export FPATH=$ZSH/cache/completions:$FPATH
sudo mkdir -p $NXE_WS_DEVCONTAINER/persist/zsh/
export ZSH_COMPDUMP=$NXE_WS_DEVCONTAINER/persist/zsh/.zcompdump
export HISTFILE=$NXE_WS_DEVCONTAINER/persist/zsh/.zsh_history

compinit -d $ZSH_COMPDUMP

setopt INC_APPEND_HISTORY
# location of history file
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
