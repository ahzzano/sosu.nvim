local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000
    },
    servers = {
        ['gofumpt'] = { 'go' },
        ['clang-format'] = {'c', 'cpp'},
    }
})

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.setup()
