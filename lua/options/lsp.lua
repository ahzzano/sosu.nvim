local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

default_opts = {
	capabilities = capabilities
}

require('mason-lspconfig').setup {
	ensure_installed = {'rust_analyzer', 'rome', 'pyright', 'clangd', 'ruby_ls', 'volar', 'gopls', 'asm_lsp'},
	automatic_installation = false
}

-- LSP
lspconfig.clangd.setup(default_opts)
lspconfig.pyright.setup(default_opts)
lspconfig.rome.setup(default_opts)
lspconfig.rust_analyzer.setup(default_opts)
lspconfig.ruby_ls.setup(default_opts)
lspconfig.volar.setup(default_opts)
lspconfig.gopls.setup(default_opts)
lspconfig.asm_lsp.setup(default_opts)


