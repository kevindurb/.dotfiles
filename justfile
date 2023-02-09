default: up

up:
  rcup

brew:
  brew update
  brew bundle

create:
  distrobox create
