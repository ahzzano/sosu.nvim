local plugins = {
    -- dap stuff
    {
        'mfussenegger/nvim-dap',
        config = function()
            require('plugins.configs.dap')
        end
    },
    "jay-babu/mason-nvim-dap.nvim",
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            require('dap-python').setup('python')
        end,

    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require('nvim-dap-virtual-text').setup {
                virt_text_Pos = 'inline',
                highlight_changed_variables = false,
                all_frames = true
            }
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function()
            require('plugins.configs.telescope')
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function()
            local dap_go = require('dap-go').setup()
            vim.keymap.set('n', '<leader>dgt', function()
                require('dap-go').debug_test()
            end)
            vim.keymap.set('n', '<leader>dgl', function()
                require('dap-go').debug_last()
            end)
        end

    },
    -- Main
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-cmdline",
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "j-hui/fidget.nvim",
        opts = {

        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        opts = {},
        lazy = false
    },
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require('nvim-tmux-navigation')

            nvim_tmux_nav.setup {
                disable_when_zoomed = true -- defaults to false
            }

            vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
            vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
            vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
            vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
            vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
            vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        end
    },
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.ai').setup()
            require('mini.surround').setup()
            local files = require('mini.files')
            files.setup()

            vim.keymap.set('n', 'pv', function()
                files.open()
            end)
        end
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            notifier = { enabled = true },
            indent = { enabled = true },
            debug = { enabled = true },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            setup = {
                rust_analyzer = function()
                    return true
                end
            }

        },

        config = function(_)
            require("plugins.configs.lspconfig")
            require("plugins.configs.cmp")
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "single",
            },
            ensure_installed = {
                'clangd',
                'gopls',
                'rust_analyzer',
                'zls',
                'lua_ls',
                'pyright',
                'debugpy'
            }
        },
        build = function()
            pcall(vim.api.nvim_command, "MasonUpdate")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { 'windwp/nvim-autopairs' }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        opts = {
            enable_autosnippets = true,
        },
        config = true,
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        config = function()
            require("plugins.configs.treesitter")
        end,
        event = "VeryLazy",
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "markdown", "xml", "typescript", "vue", "jsx", "svelte" },
        lazy = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.configs.lualine")
        end,
        lazy = false,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
        ft = { "rust" },
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        lazy = true,
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {},
    },
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        opts = {},

    },
    {
        "sainnhe/sonokai",
        priority = 1000,
        config = function()
            vim.g.sonokai_style = "shusia"
        end

    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("plugins.configs.neogit")
        end,
        event = "VeryLazy",
        lazy = true,
    },
}

return plugins
