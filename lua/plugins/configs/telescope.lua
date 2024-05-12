local actions = require 'telescope.actions'

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
            }
        },
        file_ignore_patterns = {
            "%.git/", "%.git\\",
            "%.node%_modules/", "%.node%_modules\\"
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
        git_files = {
            theme = "dropdown",
            previewer = false
        },
        grep_string = {
            theme = "ivy"
        },
        lsp_references = {
            theme = "ivy",
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
}

require("telescope").load_extension('fzf')

local builtin = require('telescope.builtin')

-- vim.keymap.set('i', '<C-p>', builtin.find_files);
-- vim.keymap.set('i', '<C-g>', builtin.git_files);

vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<leader>gf', builtin.git_files)
vim.keymap.set('n', '<leader>bf', builtin.buffers)
vim.keymap.set('n', '<leader>gs', function()
    builtin.grep_string({ search = vim.fn.input("Grep Search > ") })
end)

-- harpoon settings
local harpoon = require('harpoon')
local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({
        theme = 'dropdown',
    }, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        -- previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find({theme = 'dropdown'})
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
