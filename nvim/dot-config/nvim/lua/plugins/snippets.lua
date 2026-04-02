local gh = require('kevindurb.utils').gh
vim.pack.add({ gh('nvim-mini/mini.snippets') })

vim.schedule(function()
  local MiniSnippets = require('mini.snippets')
  MiniSnippets.setup()

  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      while MiniSnippets.session.get() do
        MiniSnippets.session.stop()
      end
    end,
  })
end)
