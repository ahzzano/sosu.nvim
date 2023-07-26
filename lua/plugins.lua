-- Essentials
local devicons = { 'nvim-tree/nvim-web-devicons', }
local plenary = { 'nvim-lua/plenary.nvim' }

-- Gitsigns
local gitsigns = {
    'lewis6991/gitsigns.nvim',
    opts = {}
}

-- DAP
local dap = { 'mfussenegger/nvim-dap' }

-- LSP
local lspconfig = { 'neovim/nvim-lspconfig' }
local mason = { 'williamboman/mason.nvim', opts = {} }
local mason_config = { 'williamboman/mason-lspconfig.nvim', opts = {} }

-- Code Completion
local nvim_cmp = { 'hrsh7th/nvim-cmp' }
local luasnip = { 'L3MON4D3/LuaSnip' }
local luasnip_nvimcmp = { 'saadparwaiz1/cmp_luasnip' }
local cmp_nvim_lsp = { 'hrsh7th/cmp-nvim-lsp' }

-- Syntax Highlighting
local treesitter = { 'nvim-treesitter/nvim-treesitter' }
local autotag = { 'windwp/nvim-ts-autotag' }

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
    dependencies = { 'nvim-lua/plenary.nvim' }
}

-- Autopairs
local autopairs = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
}

-- Theme
local rose_pine = {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
        variant = 'moon',
        disable_italics = true
    }
}

local tokyo_night = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}

-- Statusline
local lualine = {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy"
}

-- Greeter
local dashboard = {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

local rust_tools = {
    'simrat39/rust-tools.nvim'
}

local comments = {
    'numToStr/Comment.nvim', opts = {}
}

return { autopairs, rose_pine, treesitter, lualine, devicons, mason, mason_config, nvimtree, lspconfig, nvim_cmp,
    luasnip, luasnip_nvimcmp, cmp_nvim_lsp, plenary, telescope, dashboard, gitsigns, dap, rust_tools, comments, autotag, tokyo_night }
