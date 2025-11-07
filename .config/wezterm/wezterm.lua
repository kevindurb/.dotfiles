local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaMono Nerd Font')
config.font_size = 13
config.color_scheme = 'Catppuccin Macchiato'
config.default_prog = { 'zsh', '-l' }
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true
config.window_decorations = 'RESIZE'

return config
