require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'cpp', 'rust', 'python', 'typescript', 'vue', 'make', 'html', 'javascript', 'lua' },
    auto_install = true,
    autotag = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }

}