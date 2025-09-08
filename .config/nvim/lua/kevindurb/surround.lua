local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('nvim-mini/mini.surround')

  later(function()
    require('mini.surround').setup({
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`
      },
    })
  end)
end

return M
