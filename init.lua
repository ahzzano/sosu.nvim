require('sosu.keymappings')
require('sosu.config')

require('lazy.lazy')

require('sosu.colors')

require('plugins')
require('plugins.setup')()

vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })
