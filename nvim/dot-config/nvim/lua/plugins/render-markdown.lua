local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('MeanderingProgrammer/render-markdown.nvim') })

vim.schedule(function()
  require('render-markdown').setup({
    preview = {
      filetypes = { 'markdown', 'codecompanion' },
      ignore_buftypes = {},
    },
  })
end)
