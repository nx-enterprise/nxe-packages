#!/bin/zsh

setopt INC_APPEND_HISTORY
# location of history file
HISTFILE="${NXE_WS_DEVCONTAINER}/persist/.zsh_history"
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
