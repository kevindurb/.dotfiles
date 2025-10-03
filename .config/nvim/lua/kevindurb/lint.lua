local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add('mfussenegger/nvim-lint')

  later(function()
    local lint = require('lint')
    lint.linters_by_ft = {
      ansible = { 'ansible_lint' },
      javascript = { 'eslint', 'biomejs', 'snyk_iac' },
      javascriptreact = { 'eslint', 'biomejs' },
      shell = { 'shellcheck' },
      typescript = { 'eslint', 'biomejs' },
      typescriptreact = { 'eslint', 'biomejs' },
      yaml = { 'yamllint' },
      php = { 'phpcs' },
      go = { 'golangcilint' },
      dockerfile = { 'hadolint' },
      nix = { 'nix' },
    }
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end)
end

return M
