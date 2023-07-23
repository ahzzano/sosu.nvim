local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
            }
        },
        file_ignore_patterns={
            "%.git/", "%.git\\",
            "%.node%_modules/", "%.node%_modules\\"
        },
    },
    pickers = {
        find_files = {
            theme="dropdown",
            previewer=false
        },
        buffers = {
            theme="dropdown",
            previewer=false
        }
    },

}
