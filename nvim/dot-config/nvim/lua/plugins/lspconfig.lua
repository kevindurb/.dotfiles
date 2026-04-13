local gh = require('kevindurb.utils').gh
vim.pack.add(vim.tbl_map(gh, { 'b0o/schemastore.nvim', 'neovim/nvim-lspconfig' }))

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
  'sqls',
  'ts_ls',
  'yamlls',
})
