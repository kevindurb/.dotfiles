local colors = require("catppuccin.palettes").get_palette("macchiato")

require("scrollbar").setup({
  handle = { text = " ", color = colors.surface2 },
  handlers = {
    cursor = false,
    diagnostic = true,
    gitsigns = true,
    handle = true,
    search = true,
    ale = false,
  },
})
require("scrollbar.handlers.search").setup()
require("scrollbar.handlers.gitsigns").setup()
