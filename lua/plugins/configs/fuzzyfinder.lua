local fzf = require("fzf-lua")
local ignore_fdirs = {
    'node_modules',
    'bin',
    '.git',
    'build',
    'target',
    'include'
}
fzf.setup({
    -- fzf_opts = { ['--layout'] = 'reverse-list' },
    files = {
        previewer = true,
        file_ignore_patterns = ignore_fdirs
    },
    git = {
        files = {
            previewer = true,
            file_ignore_patterns = ignore_fdirs
        }
    },
    lsp = {
        async = true
    }
})

vim.keymap.set('i', '<C-p>', fzf.files);
vim.keymap.set('i', '<C-g>', fzf.git_files);

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = "[F]ind [F]iles" })
vim.keymap.set('n', '<leader>fg', fzf.git_files, { desc = "[F]ind [G]its" })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "[F]ind [B]uffers" })
vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, { desc = "[F]ind [D]iagnostics" })
