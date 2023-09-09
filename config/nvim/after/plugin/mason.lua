local options = {
  ensure_installed = {
    'bash-language-server',
    'css-lsp',
    'dockerfile-language-server',
    'eslint-lsp',
    'eslint_d',
    'graphql-language-service-cli',
    'html-lsp',
    'js-debug-adapter',
    'lua-language-server',
    'prettierd',
    'shellcheck',
    'sqlfluff',
    'sqlls',
    'stylua',
    'typescript-language-server',
    'yaml-language-server',
    'yamlfmt',
    'yamllint',
  },
}

require('mason').setup(options)

vim.api.nvim_create_user_command('MasonInstallAll', function()
  vim.cmd('MasonInstall ' .. table.concat(options.ensure_installed, ' '))
end, {})

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
