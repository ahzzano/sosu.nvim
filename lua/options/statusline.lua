-- LUA LINE
local opts={
	icons_enabled=true,
	disabled_filetypes = { 
		'NVimTree'
	},
	disabled_buftypes = {'NvimTree'}
}

require('lualine').setup(opts)
