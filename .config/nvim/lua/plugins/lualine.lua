return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'SmiteshP/nvim-navic',
  },
  opts = {
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
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
  },
}
