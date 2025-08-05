return {
  'nordtheme/vim',
  name = 'nord',
  priority = 1000,
  enabled = true,
  init = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('nord')
  end,
}
