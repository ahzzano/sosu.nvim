-- NvimTree Related
local api = require "nvim-tree.api"

vim.keymap.set('n', '<C-t>', ':NvimTreeFocus<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Toggle Term
vim.keymap.set('n', 't', ':ToggleTerm<CR>')
