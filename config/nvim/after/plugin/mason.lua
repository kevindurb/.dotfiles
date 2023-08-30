require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup({
  capabilities = capabilities,
  settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
})

require('lspconfig').yamlls.setup({
  capabilities = capabilities,
  settings = { yaml = { schemas = require('schemastore').yaml.schemas() } },
})

require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

require('lspconfig').tsserver.setup({ capabilities = capabilities })
require('lspconfig').ansiblels.setup({ capabilities = capabilities })
require('lspconfig').bashls.setup({ capabilities = capabilities })
require('lspconfig').cssls.setup({ capabilities = capabilities })
require('lspconfig').dockerls.setup({ capabilities = capabilities })
require('lspconfig').eslint.setup({ capabilities = capabilities })
require('lspconfig').graphql.setup({ capabilities = capabilities })
require('lspconfig').html.setup({ capabilities = capabilities })
require('lspconfig').intelephense.setup({ capabilities = capabilities })
require('lspconfig').sqlls.setup({ capabilities = capabilities })
require('lspconfig').rnix.setup({ capabilities = capabilities })

-- TODO: switch to formatter.nvim and mfussenegger/nvim-lint
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('null-ls').setup({
  temp_dir = '/tmp',
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})

require('mason-null-ls').setup({ automatic_setup = true, handlers = {} })
require('mason-nvim-dap').setup({ automatic_setup = true })
