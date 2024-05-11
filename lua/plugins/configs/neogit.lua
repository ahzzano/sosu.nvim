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
