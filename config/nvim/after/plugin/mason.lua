require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").ansiblels.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").cssls.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").graphql.setup {}
require("lspconfig").html.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").intelephense.setup {}
require("lspconfig").sqlls.setup {}
require("lspconfig").yamlls.setup {}
