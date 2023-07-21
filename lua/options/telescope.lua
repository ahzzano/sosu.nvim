require('telescope').setup {
    defaults = {
        file_ignore_patterns={
            "%.git/", "%.git\\",
            "%.node%_modules/", "%.node%_modules\\"
        }
    },

}
