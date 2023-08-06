local plugins = {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
        lazy = true
    },
    { 'nvim-lua/plenary.nvim' },
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
        lazy = true,
        event = "InsertEnter",
    },
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        event = "InsertEnter",
    },
    {
        'williamboman/mason.nvim',
        opts = {
        },
        build = function()
            pcall(vim.api.nvim_command, 'MasonUpdate')
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'clangd',
                'gopls',
                'pyright',
                'rust_analyzer',
                'lua_ls',
                'rome',
                'tsserver',
            }
        },
        lazy = true
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim', },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
            { 'saadparwaiz1/cmp_luasnip' }
        },
        config = function(_)
            require('plugins.configs.lspconfig')
            require('plugins.configs.cmp')
        end,
        event = "InsertEnter",
        lazy = true,
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        opts = {},
        lazy = true
    },
    {
        'saadparwaiz1/cmp_luasnip',
        lazy = true
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = true
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        config = function()
            require('plugins.configs.treesitter')
        end,
        event = "VeryLazy",
    },
    {
        'windwp/nvim-ts-autotag',
        ft = {
            "html", "markdown", "xml", "typescript", "vue", "jsx"
        },
        lazy = true
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            "<C-n>"
        },
        config = function()
            require('plugins.configs.nvimtree')
        end,
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
        'sainnhe/everforest'
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        lazy = true,
    },

    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'simrat39/rust-tools.nvim',
        ft = { 'rust' },
        config = function()
            local rust_tools = require('rust-tools')

            rust_tools.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                    end
                }
            })
        end,
        dependencies = {
            { 'VonHeikemen/lsp-zero.nvim' }
        }
    },
    {
        'numToStr/Comment.nvim',
        event = "InsertEnter",
        lazy = true
    },
    {
        'ThePrimeagen/harpoon',
        lazy = true,
        event = "VeryLazy"
    },
    {
        "folke/neodev.nvim",
        ft = { "lua" },
        opts = {},
        lazy = true,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {},
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter' }
        },
        lazy = true,
        event = "InsertEnter"
    }

}

return plugins
