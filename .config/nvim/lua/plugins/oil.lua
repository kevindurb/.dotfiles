return {
  'stevearc/oil.nvim',
  dependencies = { 'echasnovski/mini.icons' },
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  init = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
