local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add({
    source = 'greggh/claude-code.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
    },
  })

  later(function()
    require('claude-code').setup({
      command = 'claudia',
      window = {
        position = 'vertical',
      },
    })
  end)
end

return M
