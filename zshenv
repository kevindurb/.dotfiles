# vi: ft=zsh

export DOTFILES=$HOME/.dotfiles
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files'
export LESS="-SRXF"
export HISTFILE=$HOME/.zhistory
export HOMEBREW_NO_AUTO_UPDATE=1
export ASPNETCORE_ENVIRONMENT="Development"
export DISABLE_AUTO_TITLE="true"
export TERMINFO=/etc/terminfo

# Package Manager Bins
CARGO_BIN=$HOME/.cargo/bin
GO_BIN=/usr/local/go/bin
BREW_BIN=/opt/homebrew/bin

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
# X11_BIN=/opt/X11/bin Do I need this?

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
$GO_BIN:\
$BREW_BIN
