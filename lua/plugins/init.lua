local plugins = {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        config = function()
            local fzf = require('fzf-lua')
            local ignore_fdirs = {
                'node_modules',
                'bin',
                '.git',
                'build',
                'target',
                'include'
            }
            fzf.setup({
                files = {
                    previewer = false,
                    file_ignore_patterns = ignore_fdirs
                },
                git = {
                    files = {
                        previewer = false,
                        file_ignore_patterns = ignore_fdirs
                    }
                },
                lsp = {
                    async = true

                }
            })
            vim.keymap.set('n', '<leader>ff', fzf.files)
            vim.keymap.set('n', '<leader>fF', fzf.git_files)

            vim.keymap.set('n', '<leader>fgb', fzf.git_branches)

            vim.keymap.set('n', '<leader>gd', fzf.lsp_definitions)
            vim.keymap.set('n', '<leader>gr', fzf.lsp_references)
        end,
        opts = {}
    },
    -- Main
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
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
        dependencies = {
            "folke/snacks.nvim",
        },
        config = function()
            require('mini.ai').setup()
            require('mini.surround').setup()
            local files = require('mini.files')
            files.setup()

            vim.keymap.set('n', 'pv', function()
                files.open()
            end)
            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesActionRename",
                callback = function(event)
                    Snacks.rename.on_rename_file(event.data.from, event.data.to)
                end,
            })
        end
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            notifier = { enabled = true },
            indent = { enabled = true },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        opts = {
        },

        config = function(_)
            require("plugins.configs.lspconfig")
            require("plugins.configs.cmp")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { 'windwp/nvim-autopairs' }
        },
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                border = "single",
            },
        },
        build = function()
            pcall(vim.api.nvim_command, "MasonUpdate")
        end,
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
        lazy = false,
        config = function()
            require('nvim-ts-autotag').setup()
        end
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
        'MeanderingProgrammer/render-markdown.nvim',
        lazy = true,
        ft = { 'markdown' },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        opts = {},
    },
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {},    -- lazy.nvim will implicitly calls `setup {}`
    },
    "nyoom-engineering/oxocarbon.nvim"
}

return plugins
