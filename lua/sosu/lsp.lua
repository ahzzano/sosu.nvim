--must install manually
--
-- tailwindcss language server
-- ts-ls
-- sveltelsp
--
vim.lsp.enable({
    'svelte',
    'ts-ls',
    'angularls',
    'tailwindcss',
    'lua_ls',
    'gopls',
    'clangd',
    -- 'biome',
    'vue_ls',
    'clangd',
    'tinymist',
    'rust-analyzer'
})

vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        virt_text_pos = "eol",
    },
    inlay_hints = {
        enable = true
    },
    float = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "󰄛",
            [vim.diagnostic.severity.INFO] = "»",
        }
    }
})

local function setup_autofmt()
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('user_autofmt', { clear = true }),
        callback = function()
            vim.lsp.buf.format({ async = false })
        end
    })
end

-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
--     callback = function(event)
--         setup_autofmt()
--     end
-- })
