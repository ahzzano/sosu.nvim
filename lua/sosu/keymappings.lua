-- Essentials
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- some timesavers
vim.keymap.set('n', '<leader>m', ':update<CR> :make<CR>')

-- Resize
vim.keymap.set('n', '<C-up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-right>', ':vertical resize +2<CR>', opts)

-- Disable help
vim.keymap.set('n', '<F1>', '', opts)
vim.keymap.set('i', '<F1>', '', opts)

-- General
-- Buffers
vim.keymap.set('n', '<leader>bh', ':bprev<CR>')
vim.keymap.set('n', '<leader>bl', ':bnext<CR>')
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')

-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, opts)

-- Conv. move
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

vim.keymap.set("n", '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true, desc = "[S]plit [V]ertically" })
vim.keymap.set("n", '<leader>sx', ':split<CR>', { noremap = true, silent = true, desc = "[S]plit Horizontally" })

vim.keymap.set('v', 'p', '"_dP"', opts)

vim.keymap.set("x", "<leader>p", "\"_dP", opts)

vim.keymap.set("n", "<leader>y", "\"+y", opts)
vim.keymap.set("v", "<leader>y", "\"+y", opts)
vim.keymap.set("n", "<leader>Y", "\"+y", opts)

vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- For OJ purposes
vim.keymap.set('n', '<leader>oj', 'ggVG"+yzz', opts)

-- better terminal
local current_term = nil
vim.keymap.set('n', "<C-t>", function()
    if current_term ~= nil then
        vim.api.nvim_buf_delete(current_term, { force = true })
        current_term = nil
    else
        vim.cmd('botright 16new')
        vim.cmd('terminal')
        current_term = vim.api.nvim_get_current_buf()
    end
end)

-- SOME LSP STUFF
vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
end, opts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.code_action, opts)

vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, opts)

vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

vim.keymap.set('n', '<leader>th', function()
    if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end
end)
