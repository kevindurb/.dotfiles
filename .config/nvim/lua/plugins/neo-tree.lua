return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = false,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.icons',
  },
  opts = {
    close_if_last_window = true,
    source_selector = {
      winbar = true,
      statusline = false
    },
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute({ action = 'close' })
        end
      },
    }
  },
  init = function()
    vim.keymap.set('n', '-', function()
      require('neo-tree.command').execute({ action = 'focus', reveal = true })
    end, { desc = 'Toggle Neotree' })
  end,
}
