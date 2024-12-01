local neogit = require('neogit')

neogit.setup({
    -- kind = 'vsplit'
    auto_refresh = true,
    integrations = {
        fzf_lua = true

    },
})

vim.keymap.set('n', '<leader>Go', ':Neogit<CR>', { desc = "Open Neogit" })

vim.keymap.set('n', '<leader>Gc', function()
    neogit.open({ "commit" })
end, { desc = "Open Neogit Commit" })

vim.keymap.set('n', '<leader>Gp', function()
    neogit.open({ "pull" })
end, { desc = 'Open Neogit Pull' })

vim.keymap.set('n', '<leader>GP', function()
    neogit.open({ "push" })
end, { desc = 'Open Neogit Push' })

vim.keymap.set('n', '<leader>Gd', function()
    neogit.open({ "diff" })
end, { desc = 'Open Neogit Diff' })
