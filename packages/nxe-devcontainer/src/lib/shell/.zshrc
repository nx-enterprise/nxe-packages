#!/bin/zsh
#set -e

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#
source $NXE_SHELL/nxe-shell-exports.zsh && echo "Sourced ${NXE_SHELL}/nxe-shell-exports.zsh" # source this first!
source $NXE_SHELL/nxe-shell-config.zsh

pushd $NXE_HOME

# load antigen
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [ -f "${NXE_HOME}/bin/antigen.zsh" ]; then echo "Antigen already installed."; else curl -L git.io/antigen > "${NXE_HOME}/bin/antigen.zsh" && echo "Antigen installed."; fi
source "${NXE_HOME}/bin/antigen.zsh"

# initialize antigen
antigen init $NXE_HOME/.antigenrc

## CANNOT CHANGE THIS BECAUSE IT IS AUTOMATICALLY ADDED
# pnpm
export PNPM_HOME=/nxe-apps-ws/node_modules/.pnpm
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# source everything else
source "${NXE_SHELL}/nxe-shell-aliases.zsh"
source "${NXE_SHELL}/nxe-shell-p10k.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-p10k.zsh"
source "${NXE_SHELL}/nxe-shell-zsh-config-loader.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-zsh-config-loader.zsh"
source "${NXE_SHELL}/nxe-shell-autocomplete.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-autocomplete.zsh"
source "${NXE_SHELL}/nxe-shell-k3s.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-k3s.zsh"

if [ ! -e $NXE_WS/bin/dotenv-linter ]; then curl -sSfL https://raw.githubusercontent.com/dotenv-linter/dotenv-linter/master/install.sh | sh -s; fi

# security stuff so ZSH doesn't yell at us
#nohup sh -c 'sudo chown -R $USERNAME /usr/local' >$NXE_HOME/nxe.log 2>&1 &
#nohup sh -c 'sudo chmod -R 755 /usr/local' >$NXE_HOME/nxe.log 2>&1 &

# sudo chmod -R 755 "${NXE_HOME}/.oh-my-zsh/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="devcontainers"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

popd


echo "Enable compinit!"
autoload -Uz compinit
compinit

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# bun completions
[ -s "/home/vscode/.bun/_bun" ] && source "/home/vscode/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
