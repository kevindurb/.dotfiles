# .dotfiles

## Setup

1. `git clone --bare git@github.com:kevindurb/.dotfiles.git ~/.dotfiles.git`
2. `alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"`
3. `dot checkout`
4. `dot submodule init && dot submodule update`

## Tracking Files

1. Add to `~/.gitignore`
2. `dot add path/to/file`

## Migrating to `stow`

1. Add files to stow package
2. `stow --verbose --simulate --dotfiles --adopt [package]`
3. `stow --verbose --dotfiles --adopt [package]`
4. `dot status`
5. `dot rm --cached ~/path/to/file`
6. Remove from `~/.gitignore`
7. Commit change with `dot`
8. Commit change to dotfiles repo
