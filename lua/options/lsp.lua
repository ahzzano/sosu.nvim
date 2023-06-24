local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

default_opts = {
	capabilities = capabilities
}

require('mason-lspconfig').setup {
	ensure_installed = {'rust_analyzer', 'tsserver', 'pyright', 'clangd'},
	automatic_installation = false
}

-- LSP
lspconfig.clangd.setup(default_opts)
lspconfig.pyright.setup(default_opts)
lspconfig.tsserver.setup(default_opts)
lspconfig.rust_analyzer.setup(default_opts)


