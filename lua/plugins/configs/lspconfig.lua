if vim.bo.filetype == "lua" then
    require("neodev").setup()
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- My usual tools
        'clangd',
        'gopls',
        'rust_analyzer',
        'zls',
        'lua_ls',
        'pyright'

        -- Good Webdev Items
    },
    -- handlers = {
    --     function(server_name)
    --         require('lspconfig')[server_name].setup({
    --             inlay_hints = true
    --         })
    --     end,
    -- },
})

require('lspconfig').gdscript.setup({
    cmd = { 'ncat', 'localhost', '6005' }, -- the important trick for Windows!
    filetypes = { 'gd', 'gdscript', 'gdscript3' }
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
        virt_text_pos = "right_align",
    },
    inlay_hints = {
        enable = true
    }
})

local function setup_keybinds(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)

    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

    vim.keymap.set('i', '<F2>', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<F3>', function() vim.lsp.buf.code_action() end, opts)

    vim.keymap.set('n', 'vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', 'vrr', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'vrf', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', 'uh', function()
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint(0, nil)
        else
            print("Inlay Hints not available")
        end
    end)
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
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint(0, nil)
        end
    end
})
