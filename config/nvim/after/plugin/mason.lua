require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {Lua = {diagnostics = {globals = {'vim'}}}}
}

require('lspconfig').yamlls.setup {
  capabilities = capabilities,
  settings = {yaml = {schemas = require('schemastore').yaml.schemas()}}
}

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = {enable = true}
    }
  }
}

require("lspconfig").tsserver.setup {capabilities = capabilities}
require("lspconfig").ansiblels.setup {capabilities = capabilities}
require("lspconfig").bashls.setup {capabilities = capabilities}
require("lspconfig").cssls.setup {capabilities = capabilities}
require("lspconfig").dockerls.setup {capabilities = capabilities}
require("lspconfig").eslint.setup {capabilities = capabilities}
require("lspconfig").graphql.setup {capabilities = capabilities}
require("lspconfig").html.setup {capabilities = capabilities}
require("lspconfig").intelephense.setup {capabilities = capabilities}
require("lspconfig").sqlls.setup {capabilities = capabilities}

require("mason-null-ls").setup({
  automatic_setup = true,
})
