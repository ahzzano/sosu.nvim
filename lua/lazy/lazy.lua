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

require("lazy").setup(plugins_file, {
    ui = {
        border = "single"
    },
    dev = {
        path = '~/Projects/nvim-plugins',
        fallback = false
    }
})
vim.keymap.set('n', "<leader>L", ':Lazy<CR>')
