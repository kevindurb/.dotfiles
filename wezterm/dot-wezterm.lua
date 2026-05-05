local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function first_existing(paths)
	for _, p in ipairs(paths) do
		local f = io.open(p, "r")
		if f then
			f:close()
			return p
		end
	end
end

config.default_prog = {
	first_existing({
		"/opt/homebrew/bin/fish",
		"/home/linuxbrew/.linuxbrew/bin/fish",
		"/usr/local/bin/fish",
		"/usr/bin/fish",
	}),
	"-l",
}

config.font = wezterm.font({
	family = "FiraCode Nerd Font",
})
config.font_size = 13
config.color_scheme = "Gruvbox Dark (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true
config.window_decorations = "RESIZE|TITLE"
config.freetype_load_target = "Light"
config.window_background_opacity = 1

config.keys = {
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

return config
