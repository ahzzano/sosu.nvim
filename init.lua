require("sosu.tasks")
require('sosu.keymappings')
require('sosu.config')

require('lazy.lazy')

require('sosu.colors')

require('plugins')
require('plugins.setup')()

local pf = vim.fn.getcwd() .. '/project.godot'
local godot_pf = io.open(pf)

if godot_pf ~= nil then
    -- vim.fn.serverstart '127.0.0.1:55432'
    print("Godot Project detected. Opened a Godot server for you")
    vim.fn.serverstart '/tmp/godot.pipe'
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
