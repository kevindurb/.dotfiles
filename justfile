tmux_plugins_dir := "~/.config/tmux/plugins"

default:
  @just -l

sync:
  stow */

overwrite package:
  stow --adopt {{package}}
  git checkout {{package}}
  stow --restow {{package}}

bootstrap: tmux-install-all-plugins
  stow --restow */

tmux-install-all-plugins:
  mkdir -p {{tmux_plugins_dir}}
  @just tmux-install-plugin "tmux-plugins/tmux-sensible"
  @just tmux-install-plugin "tmux-plugins/tmux-pain-control"
  @just tmux-install-plugin "tmux-plugins/tmux-sessionist"
  @just tmux-install-plugin "joshmedeski/tmux-nerd-font-window-name"
  @just tmux-install-plugin "egel/tmux-gruvbox"

tmux-install-plugin repo:
  #!/usr/bin/env bash
  name=$(basename {{repo}})
  dir={{tmux_plugins_dir}}/$name
  if [ -d "$dir" ]; then
      git -C "$dir" pull --ff-only
  else
      git clone https://github.com/{{repo}} "$dir"
  fi
