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
    'rust_analyzer'
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

local function setup_autocomplete(ev)
    local chars = {}
    for i = 32, 126 do
        table.insert(chars, string.char(i))
    end
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client == nil then
        print('no client')
        return
    end

    if client.server_capabilities then
        client.server_capabilities.completionProvider.triggerCharacters = chars

        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {autotrigger= true})
    end
end

-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
--     callback = function(event)
--         setup_autocomplete(event)
--     end
-- })
