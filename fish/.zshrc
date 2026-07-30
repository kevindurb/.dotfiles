#! /usr/bin/env zsh

if [[ $- == *i* ]] && [[ -z "$FISH_LAUNCHED" ]]; then
  export FISH_LAUNCHED=1
  exec fish
fi
