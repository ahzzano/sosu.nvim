local api = require "nvim-tree.api"

-- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent)
vim.keymap.set('n', '<C-t>', ':NvimTreeFocus<enter>')

