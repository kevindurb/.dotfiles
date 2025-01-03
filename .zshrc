#! /usr/bin/env zsh

# Load ~/.config/zsh/*.zsh
for FILE in $HOME/.config/zsh/*.zsh; do
  if [ -f "$FILE" ]; then
    source "$FILE"
  fi
done
