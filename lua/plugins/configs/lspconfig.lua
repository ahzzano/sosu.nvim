if vim.bo.filetype == 'lua' then
    require('neodev').setup()
end

local lsp = require('lsp-zero').preset()

vim.diagnostic.config({
    virtual_text = {
        prefix = " ",
        virt_text_pos = 'right_align',
    },
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000
    },
    servers = {
        ['null-ls'] = {
            'rust',
            'go',
            'lua',
            'html',
            'javascript',
            'typescript',
            'css'
        },
    }
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
end)

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.skip_server_setup({ 'rust_analyzer' })
lsp.setup()
