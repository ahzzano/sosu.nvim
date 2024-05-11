local neogit = require('neogit')

neogit.setup({
    kind = 'split'
})

vim.keymap.set('n', '<leader>ngo', function()
    neogit.open({
        kind = 'vsplit'
    })
end)

vim.keymap.set('n', '<leader>ngc', function()
    neogit.open({ "commit", kind = 'vsplit' })
end)

-- useful events
local group = vim.api.nvim_create_augroup('MyNeogitEvents', { clear = true })

vim.api.nvim_create_autocmd('User', {
    pattern = 'NeogitPushComplete',
    group = group,
    callback = require("neogit").close,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'NeogitPullComplete',
    group = group,
    ballback = require('neogit').close,
})
