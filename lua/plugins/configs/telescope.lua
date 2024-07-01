local actions = require 'telescope.actions'

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
            }
        },
        file_ignore_patterns = {
            -- ignore git
            ".git/",
            ".git\\",
            -- ignore node modules
            ".node_modules/",
            ".node_modules\\",
            -- ignore vscode folder
            ".vscode",
            -- ignore include directory
            "include/",
            "lib/",
            "bin/",
            "target/",
            "target\\",
        },
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'bottom',
            -- mirror=true
        },
        -- border = false,
        -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        borderchars = {
            results = { "─", "│", " ", "│", "┌", "┐", "│", "│" },

            prompt = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
    },
    pickers = {
        find_files = {
            previewer = false,
            results_title = 'Find Files',
            prompt_title = "Search Key"
        },
        buffers = {
            previewer = false,
            results_title = 'Buffers',
            prompt_title = "Search Key"
        },
        git_files = {
            previewer = false,
            results_title = "Git Files",
            prompt_title = "Search Key"
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
}

require("telescope").load_extension('fzf')

local builtin = require('telescope.builtin')

-- vim.keymap.set('i', '<C-p>', builtin.find_files);
-- vim.keymap.set('i', '<C-g>', builtin.git_files);

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>bf', builtin.buffers)
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep Search > ") })
end)
