require('kevindurb')
local packer_bootstrap = require('packer-install').ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'tpope/vim-sensible'             -- a good place to start
  use 'kevindurb/vim-whiteout'         -- show trailing whitespace
  use 'vim-airline/vim-airline'        -- statusline
  use 'vim-airline/vim-airline-themes' -- statusline themes
  use 'kevindurb/vim-splits'           -- split settings and keymaps
  use 'tpope/vim-vinegar'              -- best navigation with -
  use 'tpope/vim-commentary'           -- sweet commenting
  use 'tpope/vim-fugitive'             -- git commands in vim
  use 'tpope/vim-repeat'               -- repeating plugin commands
  use 'tpope/vim-surround'             -- surround with things
  use 'tpope/vim-unimpaired'           -- mappings for things with '['
  use 'tpope/vim-eunuch'               -- helpful unixy commands
  use 'alvan/vim-closetag'             -- autoclose tags
  use 'Raimondi/delimitMate'           -- auto close everything else
  use 'christoomey/vim-tmux-navigator' -- navigate panes in tmux && vim
  use 'godlygeek/tabular'              -- auto alignment
  use 'NvChad/nvim-colorizer.lua'      -- colorize css colors
  use 'onsails/lspkind.nvim'           -- Vscode style icons
  use 'L3MON4D3/LuaSnip'               -- snippet engine
  use 'NoahTheDuke/vim-just'           -- justfile
  use 'lewis6991/gitsigns.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  use "mhartington/formatter.nvim"
  use "nvim-tree/nvim-web-devicons"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use "b0o/schemastore.nvim"
  use 'folke/twilight.nvim'
  use "folke/zen-mode.nvim"
  use { 'utilyre/barbecue.nvim', requires = { 'SmiteshP/nvim-navic' } }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
