require('formatter').setup({
  filetype = {
    typescript = {
      require('formatter.filetypes.typescript').prettier,
      require('formatter.filetypes.typescript').eslint_d,
    },
    json = { require('formatter.filetypes.json').prettier },
    html = { require('formatter.filetypes.html').prettier },
  },
  ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
})

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])
