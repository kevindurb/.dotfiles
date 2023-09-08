require('formatter').setup({
  filetype = {
    typescript = {
      require('formatter.filetypes.typescript').prettierd,
      require('formatter.filetypes.typescript').eslint_d,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettierd,
      require('formatter.filetypes.javascript').eslint_d,
    },
    lua = { require('formatter.filetypes.lua').stylua },
    json = { require('formatter.filetypes.json').prettierd },
    html = { require('formatter.filetypes.html').prettierd },
  },
  ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  command = 'FormatWriteLock',
})
