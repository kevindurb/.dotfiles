local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add({
    source = 'olimorris/codecompanion.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  })

  later(function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
        cmd = {
          adapter = 'ollama',
        },
      },
      adapters = {
        http = {
          ollama = function()
            return require('codecompanion.adapters').extend('ollama', {
              env = {
                url = 'https://ollama.com',
                api_key = 'OLLAMA_API_KEY',
              },
              headers = {
                ['Content-Type'] = 'application/json',
                ['Authorization'] = 'Bearer ${api_key}',
              },
              parameters = {
                sync = true,
              },
            })
          end,
        },
      },
    })
  end)
end

return M
