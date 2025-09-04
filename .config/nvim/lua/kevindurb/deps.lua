local M = {}

M.setup = function()
  local now, later, add = require('mini.deps').now, require('mini.deps').later, require('mini.deps').add

  add('tpope/vim-repeat')
  add('tpope/vim-unimpaired')
  add('nvim-mini/mini.icons')
  add('nvim-mini/mini.extra')
  add('nvim-mini/mini.snippets')
  add('nvim-mini/mini.pick')
  add('nvim-mini/mini.diff')
  add('nvim-mini/mini.completion')
  add('nvim-mini/mini-git')
  add('folke/ts-comments.nvim')
  add('nvim-mini/mini.comment')
  add('windwp/nvim-ts-autotag')
  add('lewis6991/gitsigns.nvim')
  add('nvimdev/hlsearch.nvim')
  add('MeanderingProgrammer/render-markdown.nvim')
  add('catgoose/nvim-colorizer.lua')
  add('numToStr/Navigator.nvim')

  now(function()
    require('mini.icons').setup({
      file = {
        ['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
        ['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
      },
    })

    package.preload['nvim-web-devicons'] = function()
      require('mini.icons').mock_nvim_web_devicons()
      return package.loaded['nvim-web-devicons']
    end
  end)

  later(function()
    require('mini.snippets').setup()
    require('mini.completion').setup()
    require('mini.pick').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('ts-comments').setup()
    require('mini.comment').setup()
    require('nvim-ts-autotag').setup()
    require('gitsigns').setup()
    require('hlsearch').setup()
    require('render-markdown').setup({
      preview = {
        filetypes = { 'markdown', 'codecompanion' },
        ignore_buftypes = {},
      },
    })
    require('colorizer').setup({
      filetypes = { 'css', 'html', 'typescript', 'openscad' },
    })
    require('Navigator').setup()
  end)
end

return M
