local M = {}

M.setup = function()
  local now, add = require('mini.deps').now, require('mini.deps').add
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
    hooks = {
      post_checkout = function()
        vim.cmd('TSUpdate')
      end,
    },
  })

  now(function()
    require('nvim-treesitter').install({
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
      auto_install = true,
    })
  end)
end

return M
