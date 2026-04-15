vim.schedule(function()
  require('mini.diff').setup({
    view = {
      style = 'sign',
    },
  })
end)
