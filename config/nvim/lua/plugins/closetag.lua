return {
  'alvan/vim-closetag', -- autoclose tags
  init = function()
    vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx,*.js'
  end,
}
