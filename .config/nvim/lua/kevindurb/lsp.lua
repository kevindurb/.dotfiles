local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('folke/neoconf.nvim')
  add('SmiteshP/nvim-navic')
  add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'b0o/schemastore.nvim',
    }
  })

  later(function()
    require('neoconf').setup()
    require('nvim-navic').setup({
      lsp = {
        auto_attach = true,
        preference = { 'ts_ls', 'graphql' },
      }
    })
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gr', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local lspconfig = require('lspconfig')

    lspconfig.lua_ls.setup({
      settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
    })

    lspconfig.yamlls.setup({
      on_new_config = function(new_config)
        new_config.settings.yaml.schemas = vim.tbl_deep_extend(
          'force',
          new_config.settings.yaml.schemas or {},
          require('schemastore').yaml.schemas()
        )
      end,
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          keyOrdering = false,
          format = {
            enable = true,
          },
          validate = true,
          schemaStore = {
            enable = false,
            url = '',
          },
        },
      },
    })

    lspconfig.jsonls.setup({
      on_new_config = function(new_config)
        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
      end,
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    })
  end)
end

return M
