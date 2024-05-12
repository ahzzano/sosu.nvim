local harpoon = require('harpoon')
harpoon:setup({})
--
local harpolist = harpoon:list()
--
--
vim.keymap.set("n", "<leader>ha", function()
    -- mark.add_file()
    harpoon:list():add()
    print('added file to harpoon')
end)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
vim.keymap.set("n", "<C-t>", function() harpolist:select(1) end)
vim.keymap.set("n", "<C-w>", function() harpolist:select(2) end)
vim.keymap.set("n", "<C-g>", function() harpolist:select(3) end)
vim.keymap.set("n", "<C-s>", function() harpolist:select(4) end)
