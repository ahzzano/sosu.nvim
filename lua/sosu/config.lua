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

vim.opt.scrolloff = 6

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.wrap = false

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = 'indent'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.laststatus = 0

vim.opt.hlsearch = false
vim.opt.incsearch = true

--vim.cmd("colorscheme tokyonight-moon")
