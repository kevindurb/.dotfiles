local M = {}

M.setup = function()
  local later, add = require('mini.deps').later, require('mini.deps').add
  add({
    source = 'mfussenegger/nvim-dap',
    depends = {
      'nvim-lua/plenary.nvim',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'jay-babu/mason-nvim-dap.nvim',
    },
  })

  later(function()
    require('nvim-dap-virtual-text').setup()
    require('mason-nvim-dap').setup({
      automatic_installation = true,
      ensure_installed = {
        'php',
        'js',
        'firefox',
        'chrome',
      },
      handlers = {},
    })

    local dapui = require('dapui')
    local dap = require('dap')
    local widgets = require('dap.ui.widgets')
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapBreakpointRejected',
      { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
    )
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' }
    )
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapStopped',
      { text = '▶️', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = 'DiagnosticSignWarn' }
    )

    -- setup dap config by VsCode launch.json file
    local vscode = require('dap.ext.vscode')
    local json = require('plenary.json')
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end

    -- Extends dap.configurations with entries read from .vscode/launch.json
    if vim.fn.filereadable('.vscode/launch.json') then
      vscode.load_launchjs()
    end

    vim.keymap.set('n', '<leader>du', function()
      dapui.toggle({})
    end)
    vim.keymap.set({ 'n', 'v' }, '<leader>de', function()
      dapui.eval()
    end)
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end)
    vim.keymap.set('n', '<leader>db', function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set('n', '<leader>dc', function()
      dap.continue()
    end)
    vim.keymap.set('n', '<leader>dC', function()
      dap.run_to_cursor()
    end)
    vim.keymap.set('n', '<leader>dg', function()
      dap.goto_()
    end)
    vim.keymap.set('n', '<leader>di', function()
      dap.step_into()
    end)
    vim.keymap.set('n', '<leader>dj', function()
      dap.down()
    end)
    vim.keymap.set('n', '<leader>dk', function()
      dap.up()
    end)
    vim.keymap.set('n', '<leader>dl', function()
      dap.run_last()
    end)
    vim.keymap.set('n', '<leader>do', function()
      dap.step_out()
    end)
    vim.keymap.set('n', '<leader>dO', function()
      dap.step_over()
    end)
    vim.keymap.set('n', '<leader>dP', function()
      dap.pause()
    end)
    vim.keymap.set('n', '<leader>dr', function()
      dap.repl.toggle()
    end)
    vim.keymap.set('n', '<leader>ds', function()
      dap.session()
    end)
    vim.keymap.set('n', '<leader>dt', function()
      dap.terminate()
    end)
    vim.keymap.set('n', '<leader>dw', function()
      widgets.hover()
    end)
  end)
end

return M
