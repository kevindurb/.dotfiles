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
  end)
end

return M
