
plugins_file = require('plugins')
-- Lazy.nvim settings
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.termguicolors = true


require("lazy").setup(plugins_file)

-- General Settings

local tabwidth = 4

-- Settings
vim.wo.number = true
vim.opt.background = "dark" -- set this to dark or light
vim.opt.tabstop = tabwidth
vim.opt.shiftwidth= tabwidth
vim.opt.softtabstop = tabwidth
vim.opt.autoindent = true
vim.opt.expandtab = false

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.laststatus = 3

vim.cmd("colorscheme oxocarbon")


require('settings')
require('keymappings')

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })


