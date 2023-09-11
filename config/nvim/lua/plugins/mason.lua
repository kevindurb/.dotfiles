local options = {
  ensure_installed = {
    'bash-language-server',
    'css-lsp',
    'dockerfile-language-server',
    'eslint-lsp',
    'eslint_d',
    'firefox-debug-adapter',
    'graphql-language-service-cli',
    'html-lsp',
    'js-debug-adapter',
    'json-lsp',
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

return {
  'williamboman/mason.nvim', -- manages external editor tools
  opts = options,
  init = function()
    vim.api.nvim_create_user_command('MasonInstallAll', function()
      vim.cmd('MasonInstall ' .. table.concat(options.ensure_installed, ' '))
    end, {})
  end,
}
