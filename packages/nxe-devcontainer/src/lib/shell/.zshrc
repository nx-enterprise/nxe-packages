# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

## CANNOT CHANGE THIS BECAUSE IT IS AUTOMATICALLY ADDED
# pnpm
export PNPM_HOME="${NXE_WS}/node_modules/.pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
source "${NXE_SHELL}/nxe-shell-exports.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-exports.zsh" # source this first!

# source everything else
source "${NXE_SHELL}/nxe-shell-history.zsh"
source "${NXE_SHELL}/nxe-shell-aliases.zsh"
source "${NXE_SHELL}/nxe-shell-p10k.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-p10k.zsh"
source "${NXE_SHELL}/nxe-shell-antigen.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-antigen.zsh"
source "${NXE_SHELL}/nxe-shell-zsh-config-loader.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-zsh-config-loader.zsh"
source "${NXE_SHELL}/nxe-shell-autocomplete.zsh" && echo "Sourced ${NXE_SHELL}/nxe-shell-autocomplete.zsh"

if [ -f "${NXE_WS_DEVCONTAINER}/persist/kubeconfig.yaml" ]; then sed -i 's/127.0.0.1/nxe-k3s-server/' "${NXE_WS_DEVCONTAINER}/persist/kubeconfig.yaml"; else echo "Does not exist"; fi
if [ -f "${NXE_WS}/bin/dotenv-linter" ]; then curl -sSfL https://raw.githubusercontent.com/dotenv-linter/dotenv-linter/master/install.sh | sh -s; fi

# security stuff so ZSH doesn't yell at us
sudo chmod -R 755 "/usr/local/share/zsh"
sudo chmod -R 755 "/usr/local/share/zsh/site-functions"
sudo chmod -R 755 "${NXE_HOME}/.oh-my-zsh/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="devcontainers"

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


