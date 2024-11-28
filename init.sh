#! /usr/bin/env bash

alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
echo ".dotfiles.git" >> .gitignore
git clone --bare git@github.com:kevindurb/.dotfiles.git $HOME/.dotfiles.git
dot checkout
dot config --local status.showUntrackedFiles no
