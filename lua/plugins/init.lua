local plugins = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "ThePrimeagen/harpoon",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-cmdline",
    {
        "numToStr/Comment.nvim",
        config = true,
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        config=true,
        opts={},
        lazy=false
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
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        config = function()
            require("plugins.configs.nvimtree")
        end,
        event = "VeryLazy",
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },

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
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- Favorite Languages
                "clangd",        -- c/c++
                "gopls",         -- go
                "rust_analyzer", --rust
                "zls",           --zig
                "lua_ls",        --lua
                -- Webdev Things
            },
        },
        lazy = true,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional
            { "hrsh7th/nvim-cmp" },                  -- Required
            { "hrsh7th/cmp-nvim-lsp" },              -- Required
            { "L3MON4D3/LuaSnip" },                  -- Required
            { "saadparwaiz1/cmp_luasnip" },
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
        ft = { "html", "markdown", "xml", "typescript", "vue", "jsx" },
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = true,
    },
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        opts = {},
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.configs.statusline")
        end,
        lazy = false,
    },
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
        config = function()
            local rust_tools = require("rust-tools")
            rust_tools.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                    end,
                },
            })
        end,
        dependencies = {
            { "VonHeikemen/lsp-zero.nvim" },
            { "neovim/nvim-lspconfig" },
        },
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
        "folke/neodev.nvim",
        ft = { "lua" },
        opts = {},
        lazy = true,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {},
    },
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        opts = {
            --style = 'deep'
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {},
        dependencies = {
            { "nvim-treesitter/nvim-treesitter" },
        },
        lazy = true,
        event = "InsertEnter",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
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
