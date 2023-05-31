export RCRC := "~/.dotfiles/rcrc"

default: up

fmt:
    lua-format -i ./**/*.lua

up:
    rcup

brew:
    brew update
    brew bundle

create:
    distrobox create

build:
    podman build -f ./ci/Containerfile .
