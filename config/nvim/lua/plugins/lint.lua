return {
  'mfussenegger/nvim-lint', -- linting based on lsp
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      typescript = { 'eslint_d' },
      javascript = { 'eslint_d' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
