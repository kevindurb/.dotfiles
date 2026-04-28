#! /usr/bin/env fish

if status is-interactive

  set -g fish_greeting

  theme_gruvbox dark medium

  abbr --add c clear
  abbr --add g git
  abbr --add k kubectl
  abbr --add ll ls -lah

  starship init fish | source

end
