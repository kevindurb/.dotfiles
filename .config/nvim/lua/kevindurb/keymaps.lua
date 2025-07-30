local M = {}

M.setup = function()
  local map = vim.keymap.set

  -- Saner search directions
  map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
  map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
  map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
  map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
  map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
  map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
end

return M
