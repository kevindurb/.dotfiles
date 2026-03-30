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
      },
      handlers = {},
    })

    local dapui = require('dapui')
    local dap = require('dap')
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
  end)
end

return M
