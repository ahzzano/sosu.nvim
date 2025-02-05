require("mason-nvim-dap").setup({
    ensured_installed = { 'codelldb' }
})

local dap = require('dap')

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" }
}

dap.adapters.codelldb = {
    -- type = 'executable',
    -- -- command = "C:/Users/wsant/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe",
    -- name = 'lldb'
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath('data') .. "/mason/packages/codelldb/extension/adapter/codelldb.exe",
        args = { "--port", "${port}" },
        detached = false,
    }
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
        stopOnEntry = false,
    },
}

dap.configurations.rust = {
    {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp


vim.keymap.set('n', '<leader>db', function()
    dap.toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set('n', 'dr', '<cmd> DapContinue<CR>')
vim.keymap.set('n', 'dsi', '<cmd> DapStepInto<CR>')
vim.keymap.set('n', 'dso', '<cmd> DapStepOut<CR>')
vim.keymap.set('n', 'dsc', '<cmd> DapStepOver<CR>')

vim.keymap.set('n', '<F5>', '<cmd> DapStepInto<CR>')
vim.keymap.set('n', '<F6>', '<cmd> DapStepOut<CR>')
vim.keymap.set('n', '<F7>', '<cmd> DapStepOver<CR>')
