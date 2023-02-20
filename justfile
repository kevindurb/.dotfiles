export RCRC := "~/.dotfiles/rcrc"

default: up

up:
  rcup

brew:
  brew update
  brew bundle

create:
  distrobox create

build:
  podman build -f ./ci/Containerfile .
