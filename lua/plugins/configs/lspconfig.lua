if vim.bo.filetype == "lua" then
    require("neodev").setup()
end

vim.lsp.enable({
    'svelte',
    'ts-ls',
    'angularls',
    'tailwindcss',
    'lua_ls'
})

require('mason').setup({})
require("mason-lspconfig").setup({
    automatic_enable = {
        'lua_ls'
    },
    ensure_installed = {
        'biome', 'ts_ls', 'tailwindcss'
    }
})


local function setup_keybinds(event)
    local opts = { buffer = event.buf }
    local ts = require('telescope.builtin')


    vim.keymap.set('n', 'gd', ts.lsp_definitions)
    vim.keymap.set('n', 'gr', ts.lsp_references)

    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

    vim.keymap.set('n', 'td', function()
        vim.diagnostic.config({
            virtual_text = false
        })
    end)

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set('i', '<F2>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)

    vim.keymap.set('i', '<F3>', function() vim.lsp.buf.code_action() end, opts)

    vim.keymap.set('n', '<leader>vrs', function() vim.lsp.buf.rename() end,
        { buffer = event.buf, desc = "[R]ename [S]ymbol" })
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.code_action() end,
        { buffer = event.buf, desc = "Show Code Actions" })
    vim.keymap.set('n', '<leader>vcc', function() vim.lsp.buf.format({ async = true }) end,
        { buffer = event.buf, desc = "Format Document" })
    vim.keymap.set('n', '<leader>vih', function()
        if vim.lsp.inlay_hint then
            if vim.lsp.inlay_hint.is_enabled() then
                print("disabling inlay hints")
            else
                print("enabling inlay hints")
            end
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
    end, { buffer = event.buf, desc = "Toggle Inlay Hints" })
end

local function setup_autofmt()
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('user_autofmt', { clear = true }),
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        setup_keybinds(event)
        setup_autofmt()
    end
})
