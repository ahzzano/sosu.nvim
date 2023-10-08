local plugins = {
    {
        'nvim-tree/nvim-web-devicons',
        opts = {},
        lazy = true
    },
    { 'nvim-lua/plenary.nvim' },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function(_)
            mini = require('mini.files').setup()

            vim.keymap.set('n', '<leader>pv', MiniFiles.open, { noremap = true, silent = true })
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {},
        lazy = true,
        event = "InsertEnter",
    },

    --#region LSP RELATED
    -- DO NOT TOUCH
    {
        'neovim/nvim-lspconfig',
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },

        config = function(_)
            require('plugins.configs.lspconfig')
            require('plugins.configs.cmp')
        end,
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
                'rust_analyzer',
                'lua_ls',
                -- Webdev Things
                'biome',
                'tsserver',
                'tailwindcss',
            }
        },
        lazy = true
    },
    {
        'hrsh7th/cmp-cmdline',
        lazy = true,
        event = 'VeryLazy',
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
        lazy = true,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        lazy = true,
        dependencies = {
            { 'VonHeikemen/lsp-zero.nvim' },
            { "nvim-lua/plenary.nvim" }
        },
        config = function()
            require('plugins.configs.null-ls')
        end,
        event = "VeryLazy"
    },

    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        opts = {},
        config = true,
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
        'mfussenegger/nvim-dap',
        lazy = true,
        event = "VeryLazy"
    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        event = "VeryLazy",
        config = function()
            require('plugins.configs.dap')
        end
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        event = "VeryLazy",
        lazy = true,
        dependencies = {
            { 'rcarriga/nvim-dap-ui' },
            { 'mfussenegger/nvim-dap' },
            { 'williamboman/mason-lspconfig.nvim' },
        }
    },

    --#endregion
    --#region TREESITTER
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
        ft = { "html", "markdown", "xml", "typescript", "vue", "jsx" },
        lazy = true
    },
    --{
    --     "nvim-tree/nvim-tree.lua",
    --     version = "*",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     keys = {
    --         "<C-n>"
    --     },
    --     config = function()
    --         require('plugins.configs.nvimtree')
    --     end,
    --     lazy = true
    -- },

    --#endregion
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
        opts = {}
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            no_italic = true,
            term_colors = true,
            transparent_background = false,
            integrations = {
                harpoon = true,
                treesitter_context = true
            }
        }
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic'.load()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        config = function()
            require('plugins.configs.statusline')
        end,
        lazy = false,
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
            { 'VonHeikemen/lsp-zero.nvim' },
            { 'neovim/nvim-lspconfig' }
        }
    },
    {
        'saecki/crates.nvim',
        ft = { 'rust', 'toml' },
        lazy = true,
        config = function(_, opts)
            local crates = require('crates')
            crates.setup(opts)
            crates.show()
        end

    },
    {
        'numToStr/Comment.nvim',
        event = "InsertEnter",
        lazy = false,
        config = true
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
        "rebelot/kanagawa.nvim",
        priority = 1000,
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {},
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter' }
        },
        lazy = true,
        event = "InsertEnter"
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
        event = "VeryLazy",
        lazy = true
    },

}

return plugins
