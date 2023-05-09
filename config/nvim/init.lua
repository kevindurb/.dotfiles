require('kevindurb')
require('packer-install')

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'tpope/vim-sensible'             -- a good place to start
  use 'ryanoasis/vim-devicons'         -- icons for things
  use 'kevindurb/vim-whiteout'         -- show trailing whitespace
  use 'vim-airline/vim-airline'        -- statusline
  use 'vim-airline/vim-airline-themes' -- statusline themes
  use 'chrisbra/Colorizer'             -- colorize css colors
  use 'kevindurb/vim-splits'           -- split settings and keymaps
  use 'tpope/vim-commentary'           -- sweet commenting
  use 'tpope/vim-fugitive'             -- git commands in vim
  use 'tpope/vim-repeat'               -- repeating plugin commands
  use 'tpope/vim-surround'             -- surround with things
  use 'tpope/vim-unimpaired'           -- mappings for things with '['
  use 'tpope/vim-vinegar'              -- browse directories with -
  use 'tpope/vim-dispatch'             -- add backgrounding
  use 'tpope/vim-eunuch'               -- helpful unixy commands
  use 'alvan/vim-closetag'             -- autoclose tags
  use 'Raimondi/delimitMate'           -- auto close everything else
  use 'christoomey/vim-tmux-navigator' -- navigate panes in tmux && vim
  use 'vim-vdebug/vdebug'              -- debug php
  use 'christoomey/vim-sort-motion'    -- sort in directions with 'gs'
  use 'mbbill/undotree'                -- add an undo tree
  use 'godlygeek/tabular'              -- auto alignment

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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
