local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('mfussenegger/nvim-lint')

  later(function()
    local lint = require('lint')
    lint.linters_by_ft = {
      ansible = { 'ansible_lint' },
      javascript = { 'biomejs', 'eslint_d', 'snyk_iac' },
      javascriptreact = { 'biomejs', 'eslint_d' },
      shell = { 'shellcheck' },
      typescript = { 'biomejs', 'eslint_d' },
      typescriptreact = { 'biomejs', 'eslint_d' },
      yaml = { 'yamllint' },
      php = { 'phpcs' },
      go = { 'golangcilint' },
      dockerfile = { 'hadolint' },
      nix = { 'nix' },
    };
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end)
end

return M
