#! /usr/bin/env zsh

# Load ~/.config/zsh/*.zsh
for FILE in $HOME/.config/zsh/*.zsh; do
  if [ -f "$FILE" ]; then
    source "$FILE"
  fi
done

# bun completions
[ -s "/Users/kevindurbin/.bun/_bun" ] && source "/Users/kevindurbin/.bun/_bun"

# asdfasdf
