local plugins = {
    { 'nvim-tree/nvim-web-devicons', opts = {}, lazy = true },
    { 'nvim-lua/plenary.nvim' },
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'clangd',
                'clang-format',
                'gopls'
            }
        },
        lazy = true,
        build = function()
            pcall(vim.api.nvim_command, 'MasonUpdate')
        end,
    },
    { 'hrsh7th/nvim-cmp',                  lazy = true },
    { 'williamboman/mason-lspconfig.nvim', opts = {},  lazy = true },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim', },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        },
        lazy = true

    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        opts = {},
        lazy = true
    },
    { 'saadparwaiz1/cmp_luasnip',        lazy = true },
    { 'hrsh7th/cmp-nvim-lsp',            lazy = true },
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    {
        'windwp/nvim-ts-autotag',
        lazy = true
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = true
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true
    },
    {
        'windwp/nvim-autopairs',
        lazy = true,
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {
            variant = 'moon',
            disable_italics = true
        },
        priority = 1000
    },
    {
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
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            no_italic = true
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy"
    },

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'simrat39/rust-tools.nvim', lazy = true
    },
    {
        'numToStr/Comment.nvim', opts = {},
    }

}

return plugins
