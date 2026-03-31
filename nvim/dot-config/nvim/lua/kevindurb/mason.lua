-- @DEPRECATED
local M = {}

M.ensure_installed = {
  'ansible-language-server',
  'ansible-lint',
  'bash-language-server',
  'css-lsp',
  'dockerfile-language-server',
  'eslint-lsp',
  'eslint_d',
  'graphql-language-service-cli',
  'html-lsp',
  'intelephense',
  'json-lsp',
  'lua-language-server',
  'marksman',
  'php-cs-fixer',
  'phpstan',
  'prettierd',
  'shellcheck',
  'sqlfluff',
  'sqlls',
  'stylelint',
  'stylua',
  'typescript-language-server',
  'yaml-language-server',
  'yamlfmt',
  'yamllint',
}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('mason-org/mason.nvim')

  later(function()
    require('mason').setup()
    vim.api.nvim_create_user_command('MasonInstallAll', function()
      vim.cmd('MasonInstall ' .. table.concat(M.ensure_installed, ' '))
    end, {})
  end)
end

return M
