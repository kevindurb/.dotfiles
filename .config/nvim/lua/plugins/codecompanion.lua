return {
  enabled = false,
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<C-a>',     '<cmd>CodeCompanionActions<cr>' },
    { '<leader>a', '<cmd>CodeCompanionChat Toggle<cr>' },
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'ollama',
      },
      inline = {
        adapter = 'ollama',
      },
    },
    adapters = {
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          schema = {
            model = {
              default = 'deepseek-coder-v2',
            },
          },
        })
      end,
    },
  },
}
