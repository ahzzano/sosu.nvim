-- Essentials
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Resize
vim.keymap.set('n', '<C-up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-right>', ':vertical resize +2<CR>', opts)

-- General
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('v', 'p', '"_dP"', opts)

vim.keymap.set("x", "<leader>p", "\"_dP", opts)

vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+y", opts)

-- NvimTree Related
local api = require "nvim-tree.api"

vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<CR>', opts)

vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format, opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>gf', builtin.git_files, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep Search > ") })
end, opts)
