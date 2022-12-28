#! /bin/bash

echo "Check for dependencies"
if ! command -v git || ! command -v rcup || ! command -v zsh; then
  echo "Missing dependencies!"
  exit 1;
fi

echo "Store current dir and move to home"
pushd . &> /dev/null
cd ~

echo "Clone dotfiles repo"
git clone git@github.com:kevindurb/.dotfiles.git
cd ~/.dotfiles

echo "Do first rcup to get .rcrc setup correctly"
RCRC=~/.dotfiles/rcrc rcup

echo "Setup zsh as default shell"
chsh -s $(which zsh)

echo "Return to where ever we were at the beginning"
popd &> /dev/null
