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

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end

  -- Get colors from theme
  local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
  local bg_color = scheme.background
  local fg_color = scheme.foreground

  if tab.is_active then
    bg_color = scheme.ansi[4]
    fg_color = scheme.background
  elseif hover then
    bg_color = scheme.ansi[8]
  end

  -- Smart trimming
  local available_width = max_width - 4 -- Account for slants and padding

  if #title > available_width then
    title = string.sub(title, 1, available_width - 1) .. '…'
  end

  return {
    { Background = { Color = scheme.background } },
    { Foreground = { Color = bg_color } },
    { Text = '' },
    { Background = { Color = bg_color } },
    { Foreground = { Color = fg_color } },
    { Text = title },
    { Background = { Color = scheme.background } },
    { Foreground = { Color = bg_color } },
    { Text = '' },
  }
end)

return config
