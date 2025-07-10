#! /usr/bin/env zsh

alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
compdef dot="git"

[ -x "$(command -v bat)" ] && alias cat="bat"
[ -x "$(command -v prettyping)" ] && alias ping="prettyping"
[ -x "$(command -v eza)" ] && alias ll="eza -lha --hyperlink --icons"
[ -x "$(command -v go-task)" ] && alias task="go-task"

alias g="git"
compdef g="git"

alias c="clear"
compdef c="clear"

alias gt="task --global"
compdef gt="task"

setopt complete_aliases
