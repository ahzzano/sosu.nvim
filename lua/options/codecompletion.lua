
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select=false}),
		['<C-y>'] = cmp.mapping.confirm({select=true}),
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<Down>'] = cmp.mapping.select_next_item(select_opts),

		['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-n>'] = cmp.mapping.select_next_item(select_opts),
		['<Tab>'] = cmp.mapping(function(fallback)
		  local col = vim.fn.col('.') - 1

		  if cmp.visible() then
			cmp.select_next_item(select_opts)
		  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
			fallback()
		  else
			cmp.complete()
		  end
		end, {'i', 's'}),
	}),
	window = {
		completion = cmp.config.window.bordered()
	},
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		{name = 'luasnip'}
	}, {name='buffer'})
})
