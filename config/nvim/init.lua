require('kevindurb')
require('lazy-install').ensure_lazy()
require('lazy').setup({
  'wbthomason/packer.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
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
  'nvim-lualine/lualine.nvim', -- pretty lower bar
  'akinsho/bufferline.nvim', -- pretty tabs
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
  }, -- pretty search
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  }, -- the base for all things better
  'williamboman/mason.nvim', -- manages external editor tools
  'williamboman/mason-lspconfig.nvim', -- connects mason to lspconfig
  'neovim/nvim-lspconfig', -- language server configurations
  'hrsh7th/nvim-cmp', -- auto complete menu
  'hrsh7th/cmp-nvim-lsp', -- lsp in auto complete menu
  'hrsh7th/cmp-buffer', -- auto complete buffer text
  'f3fora/cmp-spell', -- auto complete spelling
  'petertriho/cmp-git', -- auto complete git things
  'davidsierradz/cmp-conventionalcommits', -- auto complete conventional commits
  'mhartington/formatter.nvim', -- auto format files
  'nvim-tree/nvim-web-devicons', -- cool icons
  'b0o/schemastore.nvim', -- json schemas
  { 'utilyre/barbecue.nvim', dependencies = { 'SmiteshP/nvim-navic' } }, -- breadcrumb bar
  'mfussenegger/nvim-lint', -- linting based on lsp
  'numToStr/Comment.nvim', -- commenting based on lsp
})
