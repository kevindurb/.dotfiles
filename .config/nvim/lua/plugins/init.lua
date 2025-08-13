-- Just basic plugins that dont need
-- any setup
return {
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',
  'tpope/vim-eunuch',
  'tpope/vim-abolish',
  'godlygeek/tabular',
  'Bekaboo/dropbar.nvim',
  { 'lukas-reineke/indent-blankline.nvim', opts = {}, main = 'ibl' },
  { 'echasnovski/mini.completion',         opts = {} },
  { 'echasnovski/mini-git',                opts = {}, main = 'mini.git' },
  { 'echasnovski/mini.comment',            opts = {}, event = 'VeryLazy' },
  { 'windwp/nvim-ts-autotag',              opts = {} },
  { 'stevearc/dressing.nvim',              opts = {} },
  { 'j-hui/fidget.nvim',                   opts = {}, event = 'LspAttach' },
  { 'lewis6991/gitsigns.nvim',             opts = {} },
  { 'nvimdev/hlsearch.nvim',               opts = {} },
  { 'folke/neoconf.nvim',                  opts = {} },
  { 'folke/ts-comments.nvim',              opts = {}, event = 'VeryLazy' },
  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        separator_style = 'thin',
        diagnostics = 'nvim_lsp',
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    opts = {},
  },
}
