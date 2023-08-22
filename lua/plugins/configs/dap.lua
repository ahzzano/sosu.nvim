local dap = require('dap')
local dapui = require('dapui')
local widgets = require('dap.ui.widgets')

dapui.setup({
  layouts = {
    {
      elements = {
        { id = "breakpoints", size = 0.25 },
        { id = "stacks",      size = 0.40 },
        { id = "watches",     size = 0.15 },
        { id = "scopes",      size = 0.20 }
      },
      position = "right",
      size = 60,
    }
  }
})
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint<CR>', {})
vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue<CR>', {})

local function get_mason_package(package)
  return vim.fn.stdpath('data') .. '/mason/packages/' .. package .. '/'
end

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000,
  executable = {
    -- CHANGE THIS to your path!
    command = get_mason_package('codelldb') .. 'extension/adapter/codelldb.exe',
    args = { "--port", "13000" },

    -- On windows you may have to uncomment this:
    detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
