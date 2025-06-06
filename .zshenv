# vi: ft=zsh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export SHELL=$(which zsh)
export CLICOLOR=1
export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_COMMAND='rg --files'
export LESS='-SRXF'
export ASPNETCORE_ENVIRONMENT='Development'
export DISABLE_AUTO_TITLE='true'

# Package Manager Bins
CARGO_BIN=$HOME/.cargo/bin
GO_BIN=$HOME/go/bin

# Custom Bins
DOT_LOCAL_BIN=$HOME/.local/bin
PODMAN_BIN=$HOME/.local/podman/bin

# OS Bins
ROOT_BIN=/bin
ROOT_SBIN=/sbin
USR_BIN=/usr/bin
USR_SBIN=/usr/sbin
USR_LOCAL_BIN=/usr/local/bin
USR_LOCAL_SBIN=/usr/local/sbin

# path
export PATH=\
$PATH:\
$ROOT_BIN:\
$ROOT_SBIN:\
$USR_BIN:\
$USR_SBIN:\
$USR_LOCAL_BIN:\
$USR_LOCAL_SBIN:\
$DOT_LOCAL_BIN:\
$PODMAN_BIN:\
$CARGO_BIN:\
$GO_BIN
