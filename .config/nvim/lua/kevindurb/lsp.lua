local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('folke/neoconf.nvim')
  add('SmiteshP/nvim-navic')
  add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'b0o/schemastore.nvim',
    },
  })

  later(function()
    require('neoconf').setup()
    require('nvim-navic').setup({
      lsp = {
        auto_attach = true,
        preference = { 'ts_ls', 'graphql' },
      },
    })

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false, -- Avoids issues with certain plugins
            library = vim.api.nvim_get_runtime_file('', true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
          -- Add 'vim' to the list of known globals
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    vim.lsp.config('yamlls', {
      on_new_config = function(new_config)
        new_config.settings.yaml.schemas =
          vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
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

    vim.lsp.config('jsonls', {
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

    vim.lsp.enable({
      'ansiblels',
      'bashls',
      'cssls',
      'dockerls',
      'eslint',
      'gopls',
      'graphql',
      'html',
      'intelephense',
      'jsonls',
      'lua_ls',
      'marksman',
      'prismals',
      'sqlls',
      'ts_ls',
      'yamlls',
    })
  end)
end

return M
