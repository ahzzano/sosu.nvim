local neogit = require('neogit')

neogit.setup({
    kind = 'split'
})

vim.keymap.set('n', '<leader>ngo', function()
    neogit.open()
end)

vim.keymap.set('n', '<leader>ngc', function()
    neogit.open({ "commit" })
end)
