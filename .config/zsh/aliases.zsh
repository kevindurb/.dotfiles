#! /usr/bin/env zsh

alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
compdef dot="git"

[ -x "$(command -v bat)" ] && alias cat="bat"
[ -x "$(command -v prettyping)" ] && alias ping="prettyping"
[ -x "$(command -v eza)" ] && alias ll="eza -laF"
[ -x "$(command -v go-task)" ] && alias task="go-task"

alias g="git"
alias c="clear"
alias weather="curl 'wttr.in?0Q'"
alias forecast="curl wttr.in"
alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'
alias gt="task --global"

setopt complete_aliases
