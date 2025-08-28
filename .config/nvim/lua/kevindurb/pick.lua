local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add({
    source = 'nvim-mini/mini.pick',
    depends = { 'nvim-mini/mini.extra', 'nvim-mini/mini.icons' }
  })

  later(function()
    require('mini.pick').setup()
    local builtin = require('mini.pick').builtin
    local pickers = require('mini.extra').pickers
    vim.keymap.set('n', '<C-p>', builtin.files, {})
    vim.keymap.set('n', '<C-o>', pickers.commands, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end)
end

return M
