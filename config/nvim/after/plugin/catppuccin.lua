require('catppuccin').setup({
  background = { -- :h background
    light = 'latte',
    dark = 'macchiato',
  },
})

vim.cmd.colorscheme('catppuccin')
vim.o.background = 'dark'
