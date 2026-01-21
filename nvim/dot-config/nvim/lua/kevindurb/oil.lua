local M = {}

M.setup = function()
  local now, add = require('mini.deps').now, require('mini.deps').add
  add('stevearc/oil.nvim')

  now(function()
    require('oil').setup({
      view_options = {
        show_hidden = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      },
    })
  end)
end

return M
