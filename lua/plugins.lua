-- Essentials
local devicons = {'nvim-tree/nvim-web-devicons',}

-- LSP
local lspconfig = {'neovim/nvim-lspconfig', opts={}}
local mason = {'williamboman/mason.nvim', opts={}}
local mason_config = {'williamboman/mason-lspconfig.nvim', opts={}}

-- Syntax Highlighting
local treesitter = {
	'nvim-treesitter/nvim-treesitter', opts={}

}

-- File Tree
local nvimtree = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  }
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

-- Statusline
local lualine = {
'nvim-lualine/lualine.nvim', opts={
	icons_enabled=true
    },
    event = "VeryLazy"
}

return {autopairs, oxocarbon, treesitter, lualine, devicons, mason, mason_config, nvimtree}

