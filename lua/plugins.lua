-- LSP

local lspconfig = {
		'neovim/nvim-lspconfig'
}

-- Syntax Highlighting
local treesitter = {
	'nvim-treesitter/nvim-treesitter', opts={}

}

-- Autopairs
local autopairs =  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
}

-- Theme

local oxocarbon = { 
    "nyoom-engineering/oxocarbon.nvim"
}

return {autopairs, oxocarbon, treesitter}

