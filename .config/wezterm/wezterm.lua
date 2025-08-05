local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font = wezterm.font('CaskaydiaMono Nerd Font')
config.font_size = 13
config.color_scheme = 'Catppuccin Macchiato'
config.default_prog = { 'zsh', '-l' }
config.hide_tab_bar_if_only_one_tab = false
config.enable_wayland = true
config.use_fancy_tab_bar = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

return config
