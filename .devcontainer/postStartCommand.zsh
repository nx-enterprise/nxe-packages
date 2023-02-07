#!/bin/zsh
set -ex

# required to source this
source "${NXE_SCRIPTS}/init-postStart-base.sh" && echo "Sourced ${NXE_SCRIPTS}/init-postStart-base.sh"

# reference: https://unix.stackexchange.com/a/477909
# autoload -Uz compinit
# compinit

cat <<EndOfMessage

                                    HAPPY HACKING!

EndOfMessage
#source .zsh_config
