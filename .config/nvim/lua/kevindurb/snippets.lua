local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add

  add('nvim-mini/mini.snippets')
  later(function()
    local MiniSnippets = require('mini.snippets')
    MiniSnippets.setup()

    vim.api.nvim_create_autocmd('InsertLeave', {
      callback = function()
        if MiniSnippets.session.get() ~= nil then
          MiniSnippets.session.stop()
        end
      end,
    })
  end)
end

return M
