local lsp_config = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

default_opts = {
    capabilities = default_capabilities,
    on_attach = function(_, _)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.rename, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, {})
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end
}

require('mason-lspconfig').setup {
    ensure_installed = { 'rust_analyzer', 'rome', 'pyright', 'clangd', 'ruby_ls', 'volar', 'gopls', 'asm_lsp' },
    automatic_installation = false
}

for _, server in ipairs(get_servers()) do
    lsp_config[server].setup(default_opts)
end
