require('kevindurb')
local packer_bootstrap = require('packer-install').ensure_packer()

require('packer').startup(function(use)
  use({
    'wbthomason/packer.nvim',
    { 'catppuccin/nvim', as = 'catppuccin' },
    'tpope/vim-sensible', -- a good place to start
    'tpope/vim-vinegar', -- best navigation with -
    'tpope/vim-fugitive', -- git commands in vim
    'tpope/vim-repeat', -- repeating plugin commands
    'tpope/vim-surround', -- surround with things
    'tpope/vim-unimpaired', -- mappings for things with '['
    'tpope/vim-eunuch', -- helpful unixy commands
    'tpope/vim-abolish', -- messing with words and casing
    'alvan/vim-closetag', -- autoclose tags
    'Raimondi/delimitMate', -- auto close everything else
    'christoomey/vim-tmux-navigator', -- navigate panes in tmux && vim
    'godlygeek/tabular', -- auto alignment
    'NvChad/nvim-colorizer.lua', -- colorize css colors
    'onsails/lspkind.nvim', -- Vscode style icons
    'L3MON4D3/LuaSnip', -- snippet engine
    'NoahTheDuke/vim-just', -- justfile
    'rcarriga/nvim-dap-ui', -- debugging ui
    'mfussenegger/nvim-dap', -- debugging
    'Glench/Vim-Jinja2-Syntax', -- jinja2 syntax
    'lewis6991/gitsigns.nvim', -- pretty gitsigns in gutter
    'petertriho/nvim-scrollbar', -- a scrollbar
    {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }, -- pretty lower bar
    {
      'akinsho/bufferline.nvim',
      tag = '*',
      requires = 'nvim-tree/nvim-web-devicons',
    }, -- pretty tabs
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } },
    }, -- pretty search
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, -- use native fzf
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({
        with_sync = true,
      })
      ts_update()
    end,
  })

  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  })

  use('mhartington/formatter.nvim')
  use('nvim-tree/nvim-web-devicons')
  use({
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',
    'f3fora/cmp-spell',
    'petertriho/cmp-git',
    'davidsierradz/cmp-conventionalcommits',
  })
  use('b0o/schemastore.nvim')
  use('folke/twilight.nvim')
  use('folke/zen-mode.nvim')
  use({ 'utilyre/barbecue.nvim', requires = { 'SmiteshP/nvim-navic' } })

  use('mfussenegger/nvim-lint')

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
