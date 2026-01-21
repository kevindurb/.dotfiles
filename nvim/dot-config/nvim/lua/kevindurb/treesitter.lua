local M = {}

M.setup = function()
  local now, add = require('mini.deps').now, require('mini.deps').add
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd('TSUpdate')
      end,
    },
  })

  now(function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'go',
        'gotmpl',
        'html',
        'http',
        'hurl',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'prisma',
        'query',
        'regex',
        'styled',
        'typescript',
        'vim',
        'vimdoc',
      },
      sync_install = false,
      auto_install = true,

      highlight = { enable = true },
    })
  end)
end

return M
