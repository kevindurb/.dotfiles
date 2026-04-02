local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('ellisonleao/gruvbox.nvim') })

require('gruvbox').setup({
  transparent_mode = true,
})
vim.cmd.colorscheme('gruvbox')
