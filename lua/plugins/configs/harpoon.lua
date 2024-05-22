local harpoon = require('harpoon')
harpoon:setup({})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
    print('added file to harpoon')
end)

vim.keymap.set("n", "<C-t>", function() harpoon:list():select(1) end, opts)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end, opts)
vim.keymap.set("n", "<C-g>", function() harpoon:list():select(3) end, opts)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, opts)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        results_title = "Harpoon",
        prompt_title = "",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        -- previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, opts)
