vim.schedule(function()
  vim.pack.add({ 'folke/trouble.nvim' })
  require('trouble').setup()
end)
