if vim.bo.filetype == "lua" then
    require("neodev").setup()
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- the fun stuff
        'clangd',
        'gopls',
        'rust_analyzer',
        'zls',
        'lua_ls',
        'pyright',

        -- Good Webdev Items
        'ts_ls',
        'biome',
        'eslint',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                inlay_hints = true
            })
        end,
    },
})

local signs = {
    Error = "✘",
    Warn = "▲",
    Hint = "󰄛",
    Info = "»",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        virt_text_pos = "eol",
    },
    inlay_hints = {
        enable = true
    }
})

local function setup_keybinds(event)
    local opts = { buffer = event.buf }

    fzf = require('fzf-lua')

    vim.keymap.set('n', 'gd', function() fzf.lsp_definitions() end,
        { buffer = event.buf, desc = "[G]o to [D]efinitions" })
    vim.keymap.set('n', '<leader>fdd', fzf.diagnostics_document,
        { buffer = event.buf, desc = "[F]ind [D]iagnostcs in [D]ocument" })
    vim.keymap.set('n', '<leader>fdw', fzf.diagnostics_workspace,
        { buffer = event.buf, desc = "[F]ind [D]iagnostics in [W]orkspace" })
    vim.keymap.set('n', 'gr', function() fzf.lsp_references() end,
        { buffer = event.buf, desc = "[G]o to [R]eference" })
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end,
        { buffer = event.buf, desc = "[G]o to [I]mplementation" })

    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)

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
    vim.keymap.set('n', '<leader>vrf', function() vim.lsp.buf.format({ async = true }) end,
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

-- Godot things
require('lspconfig').gdscript.setup({
    cmd = { 'ncat', 'localhost', '6005' }, -- the important trick for Windows!
    filetypes = { 'gd', 'gdscript', 'gdscript3' }
})

require('lspconfig').gdscript.setup({
    cmd = { 'godot-wsl-lsp', '--useMirroredNetworking' }
})

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            hint = {
                enable = true,
            },
        }
    }
})

require('lspconfig').biome.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').julials.setup({})
require('lspconfig').svelte.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').zls.setup({})
require('lspconfig').purescriptls.setup({})
-- require('lspconfig').tsserver.setup({
--     init_options = {
--         preferences = {
--             disableSuggestions = true,
--         }
--     }
-- })
