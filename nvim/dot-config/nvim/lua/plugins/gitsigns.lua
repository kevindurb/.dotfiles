local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('lewis6991/gitsigns.nvim') })

vim.schedule(function()
  require('gitsigns').setup()
end)
