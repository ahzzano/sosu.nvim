local lsp_config = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

default_opts = {
	capabilities = default_capabilities,
    on_attach = function(_, _)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<leader>br', vim.lsp.buf.rename, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    end
}

require('mason-lspconfig').setup {
	ensure_installed = {'rust_analyzer', 'rome', 'pyright', 'clangd', 'ruby_ls', 'volar', 'gopls', 'asm_lsp'},
	automatic_installation = false
}

for _, server_name in ipairs(get_servers()) do 
    lsp_config[server_name].setup(default_opts)
end


