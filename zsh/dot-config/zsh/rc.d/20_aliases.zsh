#! /usr/bin/env zsh

[ -x "$(command -v bat)" ]        && alias cat=bat
[ -x "$(command -v prettyping)" ] && alias ping=prettyping
[ -x "$(command -v eza)" ]        && alias ll="eza -lha --hyperlink --icons"

alias g=git
alias c=clear
alias jira-me="jira issue list -q 'statusCategory != Done and assignee = currentUser()' --plain --order-by status"

compdef dot=git g=git werk=git
setopt complete_aliases
