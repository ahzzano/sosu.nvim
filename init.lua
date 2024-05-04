require('sosu.keymappings')
require('sosu.config')

require('lazy.lazy')

require('sosu.colors')

require('plugins')
require('plugins.setup')()

local pf = vim.fn.getcwd() .. '/project.godot'
if projectfile then
    vim.fn.serverstart './godothost'
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
