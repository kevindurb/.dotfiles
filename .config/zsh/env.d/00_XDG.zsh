#! /usr/bin/env zsh

: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_RUNTIME_DIR:=${DARWIN_USER_TEMP_DIR:-/run/user/$UID}}
export XDG_{CONFIG,DATA,STATE,CACHE}_HOME XDG_RUNTIME_DIR

