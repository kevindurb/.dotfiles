local M = {}

M.setup = function()
  local now, later, add = require('mini.deps').now, require('mini.deps').later, require('mini.deps').add

  add('shaunsingh/nord.nvim')
  add('tpope/vim-repeat')
  add('tpope/vim-unimpaired')
  add('lukas-reineke/indent-blankline.nvim')
  add('nvim-mini/mini.icons')
  add('nvim-mini/mini.snippets')
  add({
    source = 'nvim-mini/mini.completion',
    depends = { 'nvim-mini/mini.snippets', 'nvim-mini/mini.icons' }
  })
  add('nvim-mini/mini-git')
  add('folke/ts-comments.nvim')
  add('nvim-mini/mini.comment')
  add('windwp/nvim-ts-autotag')
  add('lewis6991/gitsigns.nvim')
  add('nvimdev/hlsearch.nvim')
  add({
    source = 'MeanderingProgrammer/render-markdown.nvim',
    depends = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  })
  add('catgoose/nvim-colorizer.lua')

  now(function()
    vim.cmd.colorscheme('nord')
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
    require('ibl').setup()
    require('mini.snippets').setup()
    require('mini.completion').setup()
    require('mini.git').setup()
    require('ts-comments').setup()
    require('mini.comment').setup()
    require('nvim-ts-autotag').setup()
    require('gitsigns').setup()
    require('hlsearch').setup()
    require('render-markdown').setup()
    require('colorizer').setup({
      filetypes = { 'css', 'html', 'typescript', 'openscad' }
    })
  end)
end

return M
