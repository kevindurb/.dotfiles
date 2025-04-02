#! /usr/bin/env zsh

# bun completions
[ -s "/Users/kevindurbin/.bun/_bun" ] && source "/Users/kevindurbin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

