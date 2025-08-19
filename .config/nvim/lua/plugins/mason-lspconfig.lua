return {
  'williamboman/mason-lspconfig.nvim', -- connects mason to lspconfig
  dependencies = {
    'b0o/schemastore.nvim',
    'williamboman/mason.nvim',
  },
  opts = {
    ensure_installed = {
      'ansiblels',
      'bashls',
      'cssls',
      'dockerls',
      'eslint',
      'graphql',
      'html',
      'intelephense',
      'jsonls',
      'lua_ls',
      'marksman',
      'sqlls',
      'ts_ls',
      'yamlls',
    },
    handlers = {
      ['lua_ls'] = function()
        require('lspconfig').lua_ls.setup({
          settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        })
      end,
      ['yamlls'] = function()
        require('lspconfig').yamlls.setup({
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
      end,
      ['jsonls'] = function()
        require('lspconfig').jsonls.setup({
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
      end,
    },
  },
}
