#! /usr/bin/env zsh
#
if [[ -f "$HOME/.antidote/antidote.zsh" ]]; then
  zstyle ':antidote:static' file $XDG_STATE_HOME/zsh/.zsh_plugins.zsh
  source $HOME/.antidote/antidote.zsh
  antidote load
fi
