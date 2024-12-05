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

dap.configurations.c = dap.configurations.cpp

dap.configurations.python =

    vim.keymap.set('n', '<leader>db', function()
        dap.toggle_breakpoint()
    end)

vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue<CR>')
vim.keymap.set('n', '<leader>dc', '<cmd> DapStepInto<CR>')
vim.keymap.set('n', '<leader>drc', '<cmd> DapStepOut<CR>')
