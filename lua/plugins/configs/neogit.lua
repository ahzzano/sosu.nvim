local neogit = require('neogit')

neogit.setup({
    -- kind = 'vsplit'
    auto_refresh = true,
    integrations = {
        fzf_lua = true

    },
})

vim.keymap.set('n', '<leader>ngo', ':Neogit<CR>')

vim.keymap.set('n', '<leader>ngc', function()
    neogit.open({ "commit" })
end)

local group = vim.api.nvim_create_augroup('MyCustomNeogitEvents', { clear = true })
vim.api.nvim_create_autocmd('User', {
    pattern = 'NeogitPushComplete',
    group = group,
    callback = require('neogit').close,
})
