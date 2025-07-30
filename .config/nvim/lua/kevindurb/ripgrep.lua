local M = {}

M.setup = function()
  -- Check if ripgrep is executable and set grepprg
  if vim.fn.executable('rg') == 1 then
    vim.opt.grepprg = 'rg --vimgrep'
  end

  -- Create Rg command for searching
  vim.api.nvim_create_user_command('Rg', function(opts)
    vim.cmd('silent! grep! ' .. opts.args)
    vim.cmd('cwindow')
    vim.cmd('redraw!')
  end, {
    nargs = '+',
    complete = 'file',
    bar = true
  })

  -- Auto open quickfix after search
  local quickfix_group = vim.api.nvim_create_augroup('quickfix', { clear = true })

  vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    group = quickfix_group,
    pattern = '[^l]*',
    command = 'cwindow'
  })

  vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    group = quickfix_group,
    pattern = 'l*',
    command = 'lwindow'
  })

  -- K keymap for searching word under cursor
  vim.keymap.set('n', 'K', function()
    local word = vim.fn.expand('<cword>')
    vim.cmd('grep! "\\b' .. word .. '\\b"')
    vim.cmd('cw')
  end)
end

return M
