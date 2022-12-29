#! /bin/bash

set -e # exit if any of the commands fail

echo "-- Check for dependencies"
if ! command -v git || ! command -v rcup || ! command -v zsh; then
  echo "Missing dependencies!"
  exit 1;
fi

echo
echo "-- Store current dir and move to home"
pushd . &> /dev/null
cd ~ || exit

echo
echo "-- Install antigen"
curl -L git.io/antigen > ~/antigen.zsh 2> /dev/null

echo
if [[ -d ~/.dotfiles ]]
then
  echo "-- Dotfiles already cloned"
else
  echo "-- Clone dotfiles repo"
  git clone git@github.com:kevindurb/.dotfiles.git
fi

echo
echo "-- Move into ~/.dotfiles"
cd ~/.dotfiles || exit

echo
echo "-- Do first rcup to get .rcrc setup correctly"
RCRC=~/.dotfiles/rcrc rcup

echo
echo "-- Setup zsh as default shell"
chsh -s "$(which zsh)"

echo
echo "-- Return to where ever we were at the beginning"
popd &> /dev/null || exit
