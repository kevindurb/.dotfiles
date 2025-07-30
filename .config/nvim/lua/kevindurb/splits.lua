local M = {}

M.setup = function()
  -- Split behavior settings
  vim.opt.splitbelow = true -- horizontal splits open down
  vim.opt.splitright = true -- vertical splits open right

  -- Quick splits keymaps
  vim.keymap.set('n', '<leader>v', ':vsp<CR>', { desc = 'Vertical split' })
  vim.keymap.set('n', '<leader>V', ':sp<CR>', { desc = 'Horizontal split' })

  -- Split navigation keymaps
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left split' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to bottom split' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to top split' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right split' })
end

return M
