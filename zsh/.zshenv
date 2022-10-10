# vi: ft=zsh

export DOTFILES=$HOME/.dotfiles
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files'
export LESS="-SRXF"
export HISTFILE=$HOME/.zhistory
export DENO_INSTALL=$HOME/.deno
export HOMEBREW_NO_AUTO_UPDATE=1

TERMINFO=/etc/terminfo

# my term paths
BREW=/opt/homebrew/bin
CARGO_BIN=$HOME/.cargo/bin
DOT_LOCAL_BIN=$HOME/.local/bin
GIT_BIN=/usr/local/git/bin
GO_BIN=/usr/local/go/bin
LOCAL_NPM_BIN=$HOME/node_modules/.bin
NPM_BIN=/usr/local/share/npm/bin
NPM_GLOBAL=$HOME/.npm-global/bin
ROOT_BIN=/bin
ROOT_SBIN=/sbin
USR_BIN=/usr/bin
USR_LOCAL_BIN=/usr/local/bin
USR_LOCAL_SBIN=/usr/local/sbin
USR_SBIN=/usr/sbin
X11_BIN=/opt/X11/bin
YARN_GLOBAL_BIN=$HOME/.config/yarn/global/node_modules/.bin
PODMAN_BIN=$HOME/.local/podman/bin

# path
export PATH=\
$BREW:\
$NPM_GLOBAL:\
$YARN_GLOBAL_BIN:\
$DOT_LOCAL_BIN:\
$LOCAL_NPM_BIN:\
$CARGO_BIN:\
$GO_BIN:\
$NPM_BIN:\
$PODMAN_BIN:\
$USR_LOCAL_BIN:\
$USR_LOCAL_SBIN:\
$USR_BIN:\
$USR_SBIN:\
$ROOT_BIN:\
$ROOT_SBIN:\
$X11_BIN:\
$GIT_BIN:\
$PATH
