local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('stevearc/conform.nvim') })

vim.schedule(function()
  require('conform').setup({
    formatters = {
      eslint_d = {
        require_cwd = true,
        cwd = require('conform.util').root_file({
          '.eslint.js',
          '.eslint.cjs',
          '.eslint.yaml',
          '.eslint.yml',
          '.eslint.json',
        }),
      },
      php_cs_fixer = {
        cwd = require('conform.util').root_file({
          '.php-cs-fixer.dist.php',
        }),
      },
    },
    formatters_by_ft = {
      typescript = { 'prettierd', 'eslint_d' },
      javascript = { 'prettierd', 'eslint_d' },
      typescriptreact = { 'prettierd', 'eslint_d' },
      javascriptreact = { 'prettierd', 'eslint_d' },
      css = { 'prettierd' },
      graphql = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      markdown = { 'prettierd' },
      yaml = { 'prettierd' },
      lua = { 'stylua' },
      php = { 'php_cs_fixer' },
      toml = { 'taplo' },
      go = { 'gofmt' },
      ['_'] = { 'trim_whitespace' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  })
end)
