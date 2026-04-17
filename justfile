default:
  @just -l

bootstrap:
  mkdir -p ~/.config/fish
  stow -R */
