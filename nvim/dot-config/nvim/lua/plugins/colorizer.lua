local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('catgoose/nvim-colorizer.lua') })

vim.schedule(function()
  require('colorizer').setup({
    filetypes = { 'css', 'html', 'typescript', 'openscad' },
  })
end)
