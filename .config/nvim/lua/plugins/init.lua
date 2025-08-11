-- Just basic plugins that dont need
-- any setup
return {
  'tpope/vim-fugitive',                                               -- git commands in vim
  'tpope/vim-repeat',                                                 -- repeating plugin commands
  'tpope/vim-unimpaired',                                             -- mappings for things with '['
  'tpope/vim-eunuch',                                                 -- helpful unixy commands
  'tpope/vim-abolish',                                                -- messing with words and casing
  'godlygeek/tabular',                                                -- auto alignment
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} }, -- indent guides
}
