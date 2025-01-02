#! /usr/bin/env zsh
# zshrc - zsh settings
# Author: Kevin Durbin

# {{{ Antidote
source $HOME/.antidote/antidote.zsh
antidote load
# }}}

# {{{ Load ~/.config/zsh/*.zsh
for FILE in $HOME/.config/zsh/*.zsh; do
  if [ -f "$FILE" ]; then
    source "$FILE"
  fi
done
# }}}
