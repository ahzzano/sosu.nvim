require('neodev').setup()

local lsp = require('lsp-zero').preset()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
end)

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()
