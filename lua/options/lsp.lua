local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.setup()
