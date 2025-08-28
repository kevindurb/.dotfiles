local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('numToStr/Navigator.nvim')

  later(function()
    require('numToStr/Navigator.nvim').setup()

    vim.keymap.set({ 'n', 'i', 'v' }, "<c-h>", "<cmd>NavigatorLeft<cr>", { silent = true, desc = "navigate left" })
    vim.keymap.set({ 'n', 'i', 'v' }, "<c-j>", "<cmd>NavigatorDown<cr>", { silent = true, desc = "navigate down" })
    vim.keymap.set({ 'n', 'i', 'v' }, "<c-k>", "<cmd>NavigatorUp<cr>", { silent = true, desc = "navigate up" })
    vim.keymap.set({ 'n', 'i', 'v' }, "<c-l>", "<cmd>NavigatorRight<cr>", { silent = true, desc = "navigate right" })
  end)
end

return M
