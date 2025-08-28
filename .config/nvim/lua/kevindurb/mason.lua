local M = {}

M.ensure_installed = {
  'ansible-lint',
  'ansiblels',
  'bashls',
  'biome',
  'cssls',
  'dockerls',
  'eslint',
  'eslint_d',
  'firefox-debug-adapter',
  'graphql',
  'html',
  'intelephense',
  'js-debug-adapter',
  'jsonls',
  'lua_ls',
  'marksman',
  'php-cs-fixer',
  'php-debug-adapter',
  'phpstan',
  'prettierd',
  'shellcheck',
  'sqlfluff',
  'sqlls',
  'stylelint',
  'stylua',
  'ts_ls',
  'yamlfmt',
  'yamllint',
  'yamlls',
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
