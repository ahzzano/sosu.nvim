-- Essentials
local devicons = {'nvim-tree/nvim-web-devicons',}
local plenary = {'nvim-lua/plenary.nvim'}

-- Gitsigns
local gitsigns = {
	'lewis6991/gitsigns.nvim',
	opts = {

	}
}

-- DAP
local dap = {'mfussenegger/nvim-dap'}

-- LSP
local lspconfig = {'neovim/nvim-lspconfig'}
local mason = {'williamboman/mason.nvim', opts={}}
local mason_config = {'williamboman/mason-lspconfig.nvim', opts={}}

-- Code Completion
local nvim_cmp = {'hrsh7th/nvim-cmp'}
local luasnip = {'L3MON4D3/LuaSnip'}
local luasnip_nvimcmp = {'saadparwaiz1/cmp_luasnip'}
local cmp_nvim_lsp = {'hrsh7th/cmp-nvim-lsp'}
local cmd_nvim_cmp = {'hrsh7th/cmp-cmdline'}

-- Toggle Term
local toggleterm = {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		float_opts = {
			border = 'curved',
		},
		direction = 'float'
	}
}

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
local treesitter = {'nvim-treesitter/nvim-treesitter'}

-- File Tree
local nvimtree = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  }
}

-- Telescope
local telescope = {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.1',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {}
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

-- Greeter
local dashboard = {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

-- Notifs
local notifs = {
	'rcarriga/nvim-notify', opts={}
}

-- Language Specific 
local rust_tools = {
	'simrat39/rust-tools.nvim',
	opts = {
	  server = {
		on_attach = function(_, bufnr)
		  -- Hover actions
		  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
		  -- Code action groups
		  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
		}
	}
}

return {autopairs, oxocarbon, treesitter, lualine, devicons, mason, mason_config, nvimtree, lspconfig, nvim_cmp, luasnip, luasnip_nvimcmp, cmp_nvim_lsp, bufferline, plenary, telescope, toggleterm, dashboard, gitsigns, dap, notifs, rust_tools, cmd_nvim_cmp}

