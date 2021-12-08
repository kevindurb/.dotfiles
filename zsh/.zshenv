# vi: ft=zsh

export DOTFILES=$HOME/.dotfiles
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files'
export LESS="-SRXF"
export HISTFILE=$HOME/.zhistory
export DENO_INSTALL=$HOME/.deno
export NPM_CONFIG_PREFIX=~/.npm-global

TERMINFO=/etc/terminfo

# my term paths
HEROKU_BIN=/usr/local/heroku/bin
NPM_BIN=/usr/local/share/npm/bin
LOCAL_NPM_BIN=$HOME/node_modules/.bin
PEAR_BIN=$HOME/pear/bin
RUBY_BIN=/usr/local/lib/ruby/gems/2.5.0/bin
USR_LOCAL_BIN=/usr/local/bin
USR_LOCAL_SBIN=/usr/local/sbin
USR_BIN=/usr/bin
USR_SBIN=/usr/sbin
ROOT_BIN=/bin
ROOT_SBIN=/sbin
X11_BIN=/opt/X11/bin
GIT_BIN=/usr/local/git/bin
CARGO_BIN=$HOME/.cargo/bin
GO_BIN=/usr/local/go/bin
DOT_LOCAL_BIN=$HOME/.local/bin
YARN_GLOBAL_BIN=$HOME/.config/yarn/global/node_modules/.bin
DENO_PATH=$DENO_INSTALL/bin
NPM_GLOBAL=$HOME/.npm-global/bin

# path
export PATH=\
$NPM_GLOBAL:\
$DENO_PATH:\
$YARN_GLOBAL_BIN:\
$DOT_LOCAL_BIN:\
$LOCAL_NPM_BIN:\
$CARGO_BIN:\
$GO_BIN:\
$HEROKU_BIN:\
$NPM_BIN:\
$PEAR_BIN:\
$RUBY_BIN:\
$USR_LOCAL_BIN:\
$USR_LOCAL_SBIN:\
$USR_BIN:\
$USR_SBIN:\
$ROOT_BIN:\
$ROOT_SBIN:\
$X11_BIN:\
$GIT_BIN:\
$PATH
