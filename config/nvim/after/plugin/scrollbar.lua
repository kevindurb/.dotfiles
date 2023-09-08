local colors = require('catppuccin.palettes').get_palette('macchiato')

require('scrollbar').setup({
  handle = { text = ' ', color = colors.surface2 },
  handlers = {
    cursor = false,
    diagnostic = true,
    gitsigns = true,
    handle = true,
    ale = false,
  },
})
require('scrollbar.handlers.gitsigns').setup()
