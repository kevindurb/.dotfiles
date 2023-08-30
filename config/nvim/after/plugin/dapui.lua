require('dapui').setup()

vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end)
vim.keymap.set('n', '<F2>', function()
  require('dap').step_over()
end)
vim.keymap.set('n', '<F3>', function()
  require('dap').step_into()
end)
vim.keymap.set('n', '<F4>', function()
  require('dap').step_out()
end)
vim.keymap.set('n', '<F6>', function()
  require('dap').close()
end)
vim.keymap.set('n', '<F10>', function()
  require('dap').toggle_breakpoint()
end)
vim.keymap.set('n', '<Leader>dr', function()
  require('dap').repl.open()
end)

vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- require('dap').configurations.typescript = {
--   {
--     type = 'pwa-node',
--     request = 'attach',
--     name = 'Attach to process',
--     cwd = '${workspaceFolder}',
--   },
-- }
