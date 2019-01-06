# vi: ft=zsh

# my term paths
DROPBOX_BIN=$HOME/Dropbox/bin
HEROKU_BIN=/usr/local/heroku/bin
HOME_BIN=$HOME/bin
NPM_BIN=/usr/local/share/npm/bin
LOCAL_NPM_BIN=$HOME/node_modules/.bin
PEAR_BIN=$HOME/pear/bin
RUBY_BIN=/usr/local/opt/ruby/bin
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
HOME_BIN=$HOME/bin
HOME_DOT_BIN=$HOME/.bin
YARN_BIN=`yarn global bin`

# path
export PATH=$HOME_DOT_BIN:$HOME_BIN:$YARN_BIN:$LOCAL_NPM_BIN:$CARGO_BIN:$DEV_SCRIPTS:$DROPBOX_BIN:$HEROKU_BIN:$HOME_BIN:$NPM_BIN:$PEAR_BIN:$RUBY_BIN:$USR_LOCAL_BIN:$USR_LOCAL_SBIN:$USR_BIN:$USR_SBIN:$ROOT_BIN:$ROOT_SBIN:$X11_BIN:$GIT_BIN

DOCKER_HELPERS=$HOME/Dropbox\ (CCBHQ)/Docker/.docker_helpers

# Added by VagrantFile Thu Jan 14 13:42:50 MST 2016
[ -f $DOCKER_HELPERS ] && source $DOCKER_HELPERS
