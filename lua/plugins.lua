-- Essentials
local devicons = { 'nvim-tree/nvim-web-devicons', lazy = true }
local plenary = { 'nvim-lua/plenary.nvim' }

-- Gitsigns
local gitsigns = {
    'lewis6991/gitsigns.nvim',
    opts = {}
}

-- LSP
local lspconfig = { 'neovim/nvim-lspconfig' }
local mason = { 'williamboman/mason.nvim', opts = {} }
local mason_config = { 'williamboman/mason-lspconfig.nvim', opts = {} }

local lsp_zero = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.api.nvim_command, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    }
}

-- Code Completion
local nvim_cmp = { 'hrsh7th/nvim-cmp' }
local luasnip = {
    'L3MON4D3/LuaSnip',
    dependencies = {
        "rafamadriz/friendly-snippets"
    }
}
local luasnip_nvimcmp = { 'saadparwaiz1/cmp_luasnip' }
local cmp_nvim_lsp = { 'hrsh7th/cmp-nvim-lsp' }

-- Syntax Highlighting
local treesitter = { 'nvim-treesitter/nvim-treesitter' }
local autotag = { 'windwp/nvim-ts-autotag', lazy = true }

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
    lazy = true,
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
    },
    priority = 1000
}

local tokyo_night = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        styles = {
            functions = { italic = false },
            keywords = { italic = false },
            variables = { italic = false },
            comments = { italic = false }
        },
    },
}

local catpuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        no_italic = true
    }
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

local harpoon = {

}

return { autopairs, rose_pine, treesitter, lualine, devicons, mason, mason_config, nvimtree, lspconfig, nvim_cmp,
    luasnip, luasnip_nvimcmp, cmp_nvim_lsp, plenary, telescope, dashboard, gitsigns, rust_tools, comments, autotag,
    tokyo_night, lsp_zero, catpuccin }
