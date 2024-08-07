require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c',
        'cpp',
        'rust',
        'python',
        'typescript',
        'vue',
        'make',
        'html',
        'javascript',
        'lua',
        'zig'
    },
    auto_install = true,
    autotag = {
        enable = true,
        filetypes = {
            "html", "xml", "tsx", "markdown", "lua", "typescript", "vue", "javascript"
        }
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
