return {
  'echasnovski/mini.pick',
  opts = {},
  init = function()
    local builtin = require('mini.pick.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-o>', builtin.commands, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end,
}
