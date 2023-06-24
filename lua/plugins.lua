-- Essentials
local devicons = {'nvim-tree/nvim-web-devicons',}

-- LSP
local lspconfig = {'neovim/nvim-lspconfig'}
local mason = {'williamboman/mason.nvim', opts={}}
local mason_config = {'williamboman/mason-lspconfig.nvim', opts={}}

-- Code Completion
local nvim_cmp = {'hrsh7th/nvim-cmp'}
local luasnip = {'L3MON4D3/LuaSnip'}
local luasnip_nvimcmp = {'saadparwaiz1/cmp_luasnip'}
local cmp_nvim_lsp = {'hrsh7th/cmp-nvim-lsp'}

-- bufferline
local bufferline = {'akinsho/bufferline.nvim', opts={
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text="NvimTree",
				separator= false,
				text_align="left",
				padding=1
			}
		}
	}
}}

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
local oxocarbon = { "nyoom-engineering/oxocarbon.nvim"}

-- Statusline
local lualine = {
	'nvim-lualine/lualine.nvim', 
    event = "VeryLazy"
}

return {autopairs, oxocarbon, treesitter, lualine, devicons, mason, mason_config, nvimtree, lspconfig, nvim_cmp, luasnip, luasnip_nvimcmp, cmp_nvim_lsp, bufferline}

