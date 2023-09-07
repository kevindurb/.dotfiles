config.load_autoconfig(True)
config.set("colors.webpage.preferred_color_scheme", "dark")
config.bind(',v', 'spawn mpv {url}')
c.auto_save.session = True
