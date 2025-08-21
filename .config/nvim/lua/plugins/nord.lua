return {
  'shaunsingh/nord.nvim',
  name = 'nord',
  priority = 1000,
  enabled = true,
  init = function()
    vim.cmd.colorscheme('nord')
  end,
}
