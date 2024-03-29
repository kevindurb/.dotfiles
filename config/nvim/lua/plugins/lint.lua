return {
  'mfussenegger/nvim-lint', -- linting based on lsp
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      ansible = { 'ansible-lint' },
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      shell = { 'shellcheck' },
      typescript = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      yaml = { 'yamllint' },
      php = { 'phpcs' },
    }
  end,
  init = function()
    local lint = require('lint')
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
