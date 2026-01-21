#! /usr/bin/env zsh

ROOT_BIN=/bin
ROOT_SBIN=/sbin
USR_BIN=/usr/bin
USR_SBIN=/usr/sbin
USR_LOCAL_BIN=/usr/local/bin
USR_LOCAL_SBIN=/usr/local/sbin
DOT_LOCAL_BIN=$HOME/.local/bin
NPM_BIN=${XDG_DATA_HOME}/npm/bin

export PATH=\
$PATH:\
$ROOT_BIN:\
$ROOT_SBIN:\
$USR_BIN:\
$USR_SBIN:\
$USR_LOCAL_BIN:\
$USR_LOCAL_SBIN:\
$NPM_BIN:\
$DOT_LOCAL_BIN
