local neogit = require('neogit')

neogit.setup({
    -- kind = 'vsplit'
})

vim.keymap.set('n', '<leader>ngo', function()
    neogit.open({})
end)

vim.keymap.set('n', '<leader>ngc', function()
    neogit.open({ "commit" })
end)

local group = vim.api.nvim_create_augroup('MyCustomNeogitEvents', { clear = true })
vim.api.nvim_create_autocmd('User', {
    pattern = 'NeogitPushComplete',
    group = group,
    callback = require('neogit').close,
})

-- useful events
-- local group = vim.api.nvim_create_augroup('MyNeogitEvents', { clear = true })
