#! /usr/bin/env zsh

local ANTIDOTE_ZSH="$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

if [[ -f "$ANTIDOTE_ZSH" ]]; then
  zstyle ':antidote:static' file $XDG_STATE_HOME/zsh/.zsh_plugins.zsh
  source "$ANTIDOTE_ZSH"
  antidote load
fi
