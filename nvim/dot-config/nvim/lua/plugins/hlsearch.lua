local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('nvimdev/hlsearch.nvim') })

vim.schedule(function()
  require('hlsearch').setup()
end)
