#! /bin/bash

# install antigen
curl -L git.io/antigen > ~/antigen.zsh

# install starship
curl -fsSL https://starship.rs/install.sh | FORCE=true sh
