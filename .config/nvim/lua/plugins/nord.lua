return {
  'nordtheme/vim',
  name = 'nord',
  priority = 1000,
  enabled = true,
  init = function()
    vim.g.nord_bold = true
    vim.g.nord_underline = true
    vim.g.nord_italic = true
    vim.g.nord_italic_comments = true
    vim.cmd.colorscheme('nord')
  end,
}
