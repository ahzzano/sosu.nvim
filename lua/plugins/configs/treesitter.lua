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
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
