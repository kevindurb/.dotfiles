local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('folke/trouble.nvim') })

vim.schedule(function()
  require('trouble').setup()
end)
