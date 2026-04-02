local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('mfussenegger/nvim-lint') })

vim.schedule(function()
  local lint = require('lint')
  lint.linters_by_ft = {
    ansible = { 'ansible_lint' },
    javascript = { 'eslint', 'biomejs', 'snyk_iac' },
    javascriptreact = { 'eslint', 'biomejs' },
    shell = { 'shellcheck' },
    sql = { 'sqlfluff' },
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
