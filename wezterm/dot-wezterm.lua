local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("Cascadia Code NF")
config.font_size = 13
config.color_scheme = "Gruvbox Dark (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true
config.window_decorations = "TITLE | RESIZE"
config.freetype_load_target = "Light"

config.keys = {
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
}

return config
