local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

default_opts = {
	capabilities = capabilities
}

require('mason-lspconfig').setup {
	ensure_installed = {'rust_analyzer', 'rome', 'pyright', 'clangd', 'ruby_ls', 'volar', 'gopls', 'asm_lsp'},
	automatic_installation = false
}

for _, server_name in ipairs(get_servers()) do 
    lspconfig[server_name].setup(default_opts)
end


