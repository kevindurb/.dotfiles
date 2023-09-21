return {
  'mfussenegger/nvim-lint', -- linting based on lsp
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      ansible = { 'ansible-lint' },
      graphql = { 'prettierd' },
      javascript = { 'eslint_d' },
      shell = { 'shellcheck' },
      typescript = { 'eslint_d' },
      yaml = { 'prettierd' },
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
