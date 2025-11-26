# vi: ft=zsh

: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_RUNTIME_DIR:=${DARWIN_USER_TEMP_DIR:-/run/user/$UID}}
export XDG_{CONFIG,DATA,STATE,CACHE}_HOME XDG_RUNTIME_DIR

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GOPATH="$XDG_DATA_HOME/go"
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
export MYCLI_HISTFILE="$XDG_DATA_HOME/mycli/history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export TLDR_CACHE_DIR="$XDG_CACHE_HOME/tldr"
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME/platformio"

export SHELL=$(which zsh)
export CLICOLOR=1
export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_COMMAND='rg --files'
export LESS='-SRXF'
export ASPNETCORE_ENVIRONMENT='Development'
export DISABLE_AUTO_TITLE='true'
export FX_THEME="1"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

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
