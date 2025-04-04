# .dotfiles

## Setup

1. `git clone --bare git@github.com:kevindurb/.dotfiles.git ~/.dotfiles.git`
2. `alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"`
3. `dot checkout`
4. `dot submodule init && dot submodule update`

## Tracking Files

1. Add to `~/.gitignore`
2. `dot add path/to/file`

## Nix

### MacOS

- `nix --extra-experimental-features nix-command --extra-experimental-features flakes run nix-darwin -- switch --flake ~/.config/nix`
- `darwin-rebuild switch --flake ~/.config/nix`

### Linux

- `nix flake update --flake .config/nix`
