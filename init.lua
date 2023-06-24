
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

require("lazy").setup(plugins_file)

-- Settings
vim.opt.background = "dark" -- set this to dark or light
vim.opt.tabstop = 4

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


vim.cmd("colorscheme oxocarbon")


require('settings')
require('keymappings')



