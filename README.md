# .dotfiles

My dotfiles managed by [rcm](https://github.com/thoughtbot/rcm)

## Installing
`curl -o- https://raw.githubusercontent.com/kevindurb/.dotfiles/main/scripts/install.sh | bash`

## Using with distrobox
- Install podman and [distrobox](https://github.com/89luca89/distrobox#installation)
- `distrobox create -i ghcr.io/kevindurb/dev dev`
- `distrobox enter dev`
- Run above install command
