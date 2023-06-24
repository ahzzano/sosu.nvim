local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

default_opts = {
	capabilities = capabilities
}

lspconfig.clangd.setup(default_opts)
lspconfig.pyright.setup(default_opts)
lspconfig.tsserver.setup(default_opts)


