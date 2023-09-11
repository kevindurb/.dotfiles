return {
  'mhartington/formatter.nvim', -- auto format files
  opts = function()
    return {
      filetype = {
        typescript = {
          require('formatter.filetypes.typescript').prettierd,
          require('formatter.filetypes.typescript').eslint_d,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettierd,
          require('formatter.filetypes.javascript').eslint_d,
        },
        graphql = { require('formatter.filetypes.graphql').prettierd },
        lua = { require('formatter.filetypes.lua').stylua },
        css = { require('formatter.filetypes.css').prettierd },
        json = { require('formatter.filetypes.json').prettierd },
        html = { require('formatter.filetypes.html').prettierd },
        markdown = { require('formatter.filetypes.markdown').prettierd },
        yaml = { require('formatter.filetypes.yaml').prettierd },
      },
      ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
    }
  end,
  init = function()
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      command = 'FormatWriteLock',
    })
  end,
}
