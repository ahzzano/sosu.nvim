local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
            }
        },
        file_ignore_patterns = {
            "%.git/", "%.git\\",
            "%.node%_modules/", "%.node%_modules\\"
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
        colorscheme = {
            theme = "dropdown"
        },
        git_files = {
            theme = "dropdown",
            previewer = false
        },
        grep_string = {
            theme = "dropdown"
        }
    },

}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files);

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>bf', builtin.buffers)
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep Search > ") })
end)
