#! /usr/bin/env zsh

[ -x "$(command -v bat)" ]        && alias cat=bat
[ -x "$(command -v prettyping)" ] && alias ping=prettyping
[ -x "$(command -v eza)" ]        && alias ll="eza -lha --hyperlink --icons"

alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias g=git
alias c=clear
alias gt="task --global"
alias werk='GIT_SSH_COMMAND="ssh -i ~/.ssh/work -o IdentitiesOnly=yes" git'
alias jme="jira issue list -q 'statusCategory != Done and assignee = currentUser()' --plain --order-by status"
alias go-task="npx @go-task/cli"

compdef dot=git g=git gt=task werk=git jme=jira
setopt complete_aliases
