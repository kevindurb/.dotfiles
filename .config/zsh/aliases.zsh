#! /usr/bin/env zsh

alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
compdef dot="git"

[ -x "$(command -v bat)" ] && alias cat="bat"
[ -x "$(command -v batcat)" ] && alias cat="batcat"
[ -x "$(command -v prettyping)" ] && alias ping="prettyping"
[ -x "$(command -v ncdu)" ] && alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
[ -x "$(command -v nvim)" ] && alias vim="nvim"

if [ -x "$(command -v eza)" ]; then
  alias ll="eza -laF"
else
  alias ll="ls -lahF"
fi

alias bb="brew bundle install --global --cleanup"

alias g="git"
compdef g="git"
alias c="clear"
alias weather="curl 'wttr.in?0Q'"
alias forecast="curl wttr.in"
alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'

if ! type pbcopy > /dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

setopt complete_aliases
