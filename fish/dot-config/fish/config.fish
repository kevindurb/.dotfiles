#! /usr/bin/env fish

if status is-interactive

  set -g fish_greeting

  theme_gruvbox dark medium

  abbr --add c clear
  abbr --add g git
  abbr --add k kubectl
  abbr --add ll ls -lah

  if command -q eza
    abbr --add ls eza
    abbr --add ll 'eza -lah --git --group-directories-first'
    abbr --add tree 'eza --tree'
  end

  if command -q bat
      abbr --add cat bat
  end

  if command -q duf
      abbr --add df duf
  end

  if command -q ncdu
      abbr --add du ncdu
  end

  if command -q htop
      abbr --add top htop
  end

  if command -q prettyping
      abbr --add ping 'prettyping --nolegend'
  end

  starship init fish | source

end
