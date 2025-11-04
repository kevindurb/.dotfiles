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

alias werk='GIT_SSH_COMMAND="ssh -i ~/.ssh/work -o IdentitiesOnly=yes" git'
compdef werk="git"

alias jme="jira issue list -q 'statusCategory != Done and assignee = currentUser()' --plain --order-by status"

setopt complete_aliases
