local M = {}

M.ensure_installed = {
  'ansible-lint',
  'biome',
  'eslint_d',
  'firefox-debug-adapter',
  'js-debug-adapter',
  'php-cs-fixer',
  'php-debug-adapter',
  'phpstan',
  'prettierd',
  'shellcheck',
  'sqlfluff',
  'stylelint',
  'stylua',
  'yamlfmt',
  'yamllint',
}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('mason-org/mason.nvim')

  later(function()
    vim.api.nvim_create_user_command('MasonInstallAll', function()
      vim.cmd('MasonInstall ' .. table.concat(M.ensure_installed, ' '))
    end, {})
  end)
end

return M
