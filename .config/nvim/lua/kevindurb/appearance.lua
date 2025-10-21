local M = {}

M.setup = function()
  local now, add = require('mini.deps').now, require('mini.deps').add

  add({ source = 'catppuccin/nvim', name = 'catppuccin' })
  add('akinsho/bufferline.nvim')
  add({
    source = 'nvim-lualine/lualine.nvim',
    depends = { 'SmiteshP/nvim-navic' },
  })

  now(function()
    vim.cmd.colorscheme('catppuccin-macchiato')
    require('bufferline').setup({
      options = {
        separator_style = 'thick',
        diagnostics = 'nvim_lsp',
        buffer_close_icon = '',
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
            local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
            local info = #vim.diagnostic.get(0, { severity = seve.INFO })
            local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

            if error ~= 0 then
              table.insert(result, { text = '  ' .. error, link = 'DiagnosticError' })
            end

            if warning ~= 0 then
              table.insert(result, { text = '  ' .. warning, link = 'DiagnosticWarn' })
            end

            if hint ~= 0 then
              table.insert(result, { text = '  ' .. hint, link = 'DiagnosticHint' })
            end

            if info ~= 0 then
              table.insert(result, { text = '  ' .. info, link = 'DiagnosticInfo' })
            end
            return result
          end,
        },
      },
    })
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
          },
        },
      },
      inactive_winbar = {
        lualine_c = {
          {
            'filename',
            path = 4,
          },
        },
      },
      winbar = {
        lualine_a = {
          {
            'filename',
            path = 4,
          },
        },
        lualine_c = {
          {
            'navic',
            color_correction = nil,
            navic_opts = nil,
          },
        },
      },
    })
  end)
end

return M
