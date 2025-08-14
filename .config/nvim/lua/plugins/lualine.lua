return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'SmiteshP/nvim-navic',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    winbar = {
      lualine_a = {
        'filename'
      },
      lualine_c = {
        {
          "navic",
          color_correction = nil,
          navic_opts = nil
        }
      }
    }
  },
}
