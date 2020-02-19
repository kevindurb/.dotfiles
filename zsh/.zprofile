# vi: ft=zsh

TERMINFO=/etc/terminfo

# my term paths
DROPBOX_BIN=$HOME/Dropbox/bin
HEROKU_BIN=/usr/local/heroku/bin
HOME_BIN=$HOME/bin
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
DEV_SCRIPTS=$HOME/Development/scripts
CARGO_BIN=$HOME/.cargo/bin
GO_BIN=$HOME/go/bin
HOME_DOT_BIN=$HOME/.bin
DOT_LOCAL_BIN=/home/kevindurb/.local/bin

# path
export PATH=\
$HOME_DOT_BIN:\
$DOT_LOCAL_BIN:\
$LOCAL_NPM_BIN:\
$CARGO_BIN:\
$GO_BIN:\
$DEV_SCRIPTS:\
$DROPBOX_BIN:\
$HEROKU_BIN:\
$HOME_BIN:\
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

# Added by docker rebuild Fri Nov 15 10:42:21 MST 2019
source ~/Development/ccb-local/.docker_helpers
