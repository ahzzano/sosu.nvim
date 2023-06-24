
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete()
	}),
	window = {
		completion = cmp.config.window.bordered()
	},
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'luasnip'}
	}, {name='buffer'})
})
