fzf = require("fzf-lua")
fzf.setup({
    -- fzf_opts = { ['--layout'] = 'reverse-list' },
    files = {
        previewer = false,
        actions = {},
        file_ignore_patterns = { 'node_modules', 'bin' }
    },
    git = {
        files = {
            previewer = false,
        }
    },
    lsp = {
        async = true
    }
})

vim.keymap.set('i', '<C-p>', fzf.files);
vim.keymap.set('i', '<C-g>', fzf.git_files);

vim.keymap.set('n', '<leader>pf', fzf.files)
vim.keymap.set('n', '<leader>gf', fzf.git_files)
vim.keymap.set('n', '<leader>bf', fzf.buffers)
