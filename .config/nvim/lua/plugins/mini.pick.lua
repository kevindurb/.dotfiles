return {
  'echasnovski/mini.pick',
  dependencies = {
    'echasnovski/mini.extra'
  },
  opts = {},
  init = function()
    local builtin = require('mini.pick').builtin
    local pickers = require('mini.extra').pickers
    vim.keymap.set('n', '<C-p>', builtin.files, {})
    vim.keymap.set('n', '<C-o>', pickers.commands, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end,
}
