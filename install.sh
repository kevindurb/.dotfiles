#! /bin/bash

sudo apt install \
  bat \
  tmux \
  exa \
  prettyping \
  make \
  git \
  zsh \
  stow \
  ripgrep \
  autojump \
  neovim

# install antigen
curl -L git.io/antigen > ~/antigen.zsh

# install starship
curl -fsSL https://starship.rs/install.sh | FORCE=true bash

# setup git repo
git clone git@github.com:kevindurb/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make
