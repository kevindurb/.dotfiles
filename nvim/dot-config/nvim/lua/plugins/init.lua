local gh = require('kevindurb.utils').gh
vim.pack.add(vim.tbl_map(gh, {
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'nvim-mini/mini.extra',
  'nvim-mini/mini.pick',
  'nvim-mini/mini.diff',
  'nvim-mini/mini.completion',
  'nvim-mini/mini-git',
  'folke/ts-comments.nvim',
  'nvim-mini/mini.comment',
  'windwp/nvim-ts-autotag',
  'lewis6991/gitsigns.nvim',
  'nvimdev/hlsearch.nvim',
  'numToStr/Navigator.nvim',
}))

vim.schedule(function()
  require('mini.completion').setup()
  require('mini.pick').setup()
  require('mini.git').setup()
  require('mini.diff').setup()
  require('ts-comments').setup()
  require('mini.comment').setup()
  require('nvim-ts-autotag').setup()
  require('gitsigns').setup()
  require('hlsearch').setup()
  require('Navigator').setup()
end)

-- lsp/treesitter
require('plugins.lspconfig')
require('plugins.treesitter')

-- appearance
require('plugins.gruvbox')
require('plugins.icons')
require('plugins.bufferline')
require('plugins.navic')
require('plugins.lualine')
require('plugins.colorizer')

-- format/lint
require('plugins.conform')
require('plugins.lint')

-- dap
require('plugins.dap')

-- ui
require('plugins.oil')
require('plugins.render-markdown')
require('plugins.trouble')

-- text
require('plugins.pairs')
require('plugins.surround')
require('plugins.snippets')

-- other
require('plugins.neoconf')
require('plugins.lazydev')
require('plugins.neogit')
