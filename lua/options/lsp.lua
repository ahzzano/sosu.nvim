local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

default_opts = {
	capabilities = capabilities
}

-- LSP
lspconfig.clangd.setup(default_opts)
lspconfig.pyright.setup(default_opts)
lspconfig.tsserver.setup(default_opts)
lspconfig.rust_analyzer.setup(default_opts)


