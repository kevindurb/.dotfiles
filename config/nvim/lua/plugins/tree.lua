return {
  'nvim-tree/nvim-tree.lua',
  opts = {},
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    vim.keymap.set('n', '-', '<cmd>NvimTreeFindFile<CR>')
  end,
}
