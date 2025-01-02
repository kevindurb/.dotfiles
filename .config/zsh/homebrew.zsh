#! /usr/bin/env zsh

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"

if [[ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ]]; then
  fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")
fi
