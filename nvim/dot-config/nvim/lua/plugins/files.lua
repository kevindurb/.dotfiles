vim.schedule(function()
  require('mini.files').setup({
    mappings = {
      close = 'q',
      go_in = '',
      go_in_plus = '<Enter>',
      go_out = '',
      go_out_plus = '-',
      mark_goto = '',
      mark_set = '',
      reset = '<BS>',
      reveal_cwd = '@',
      show_help = 'g?',
      synchronize = '=',
      trim_left = '<',
      trim_right = '>',
    },
  })
end)
