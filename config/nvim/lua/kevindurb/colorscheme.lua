local M = {}

M.setup = function()
  vim.cmd([[
    highlight Comment cterm=italic gui=italic
  ]])
end

return M
