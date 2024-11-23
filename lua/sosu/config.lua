-- Neovide Specific

if vim.g.neovide then
    vim.o.guifont = "Hack Nerd Font Mono:h10"
    local padding = 10
    vim.g.neovide_padding_top = padding
    vim.g.neovide_padding_bottom = padding
    vim.g.neovide_padding_right = padding
    vim.g.neovide_padding_left = padding
end

-- General Settings

local tabwidth = 4

-- Settings
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
-- vim.opt.filetype = true
vim.cmd('filetype plugin on')

vim.opt.tabstop = tabwidth
vim.opt.shiftwidth = tabwidth
vim.opt.softtabstop = tabwidth
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.swapfile = false

vim.opt.cursorline = true
vim.opt.scrolloff = 6

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.wrap = false

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = vim.opt.foldmethod

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.laststatus = 0
vim.opt.showtabline = 0

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.showmode = false
