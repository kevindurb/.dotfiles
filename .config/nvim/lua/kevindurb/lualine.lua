local M = {}

M.setup = function()
  local now, add = require('mini.deps').now, require('mini.deps').add
  add({
    source = 'nvim-lualine/lualine.nvim',
    depends = { 'SmiteshP/nvim-navic' },
  })
  add('akinsho/bufferline.nvim')

  now(function()
    require('bufferline').setup({
      options = {
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        buffer_close_icon = '',
      },
    })
  end)

  now(function()
    require('lualine').setup({
      extensions = {
        'man',
        'mason',
        'oil',
        'quickfix',
      },
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          {
            'lsp_status',
            icon = '',
            symbols = {
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              done = '✓',
              separator = ' ',
            },
            ignore_lsp = {},
          }
        }
      },
      inactive_winbar = {
        lualine_c = {
          {
            'filename',
            path = 4,
          }
        },
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            path = 4,
          }
        },
        lualine_c = {
          {
            "navic",
            color_correction = nil,
            navic_opts = nil
          }
        }
      },
    })
  end)
end

return M
