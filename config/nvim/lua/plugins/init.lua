-- Just basic plugins that dont need
-- any setup
return {
  'tpope/vim-sensible', -- a good place to start
  'tpope/vim-vinegar', -- best navigation with -
  'tpope/vim-fugitive', -- git commands in vim
  'tpope/vim-repeat', -- repeating plugin commands
  'tpope/vim-surround', -- surround with things
  'tpope/vim-unimpaired', -- mappings for things with '['
  'tpope/vim-eunuch', -- helpful unixy commands
  'tpope/vim-abolish', -- messing with words and casing
  'christoomey/vim-tmux-navigator', -- navigate panes in tmux && vim
  'godlygeek/tabular', -- auto alignment
  { 'NoahTheDuke/vim-just', ft = 'just' }, -- justfile
  { 'Glench/Vim-Jinja2-Syntax', ft = 'jinja2' }, -- jinja2 syntax
  'nvim-tree/nvim-web-devicons', -- cool icons
  'lukas-reineke/indent-blankline.nvim', -- indent guides
}
