config.load_autoconfig(True)

config.set("colors.webpage.preferred_color_scheme", "dark")
config.bind(',v', 'spawn mpv {url}')
config.set("auto_save.session", True)
config.set("colors.webpage.darkmode.enabled", False)
config.set("tabs.padding", { 'top': 5, 'bottom': 5, 'left': 5, 'right': 5 })
