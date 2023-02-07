#!/bin/zsh

# Starship! but it conflicts with p10k ... so disable for now. Needs to be at the top ahead of antigen.
# eval "$(starship init zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
sudo chown -R $USERNAME "${NXE_WS}/bin/"
if [ -f "${NXE_WS}/bin/antigen.zsh" ]; then echo "Antigen already installed."; else curl -L git.io/antigen > "${NXE_WS}/bin/antigen.zsh" && echo "Antigen installed."; fi
source "${NXE_WS}/bin/antigen.zsh"

# Load the oh-my-zsh library.
antigen use oh-my-zsh
DISABLE_UPDATE_PROMPT=true # because we will update via yarn

antigen theme romkatv/powerlevel10k
antigen bundle git
antigen bundle git-extras
#antigen bundle git-prompt
antigen bundle gitfast
#antigen bundle github
antigen bundle gitignore
antigen bundle darvid/zsh-poetry

## utils
antigen bundle cp
antigen bundle dirhistory
antigen bundle gnu-utils
antigen bundle encode64
antigen bundle copyfile
#antigen bundle copydir
antigen bundle composer
antigen bundle colorize
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found
antigen bundle unixorn/autoupdate-antigen.zshplugin # auto-update functions
antigen bundle npm                                  # nodejs helpers

# Tell Antigen that you are done.
antigen apply
