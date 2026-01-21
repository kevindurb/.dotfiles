local add, later = require('mini.deps').add, require('mini.deps').later

add('folke/trouble.nvim')

later(function()
  require('trouble').setup()
end)
