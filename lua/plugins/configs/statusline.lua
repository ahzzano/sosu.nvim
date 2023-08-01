local macchiato = require("catppuccin.palettes").get_palette "macchiato"

-- LUA LINE
local opts = {
    icons_enabled = true,
    options = {
        theme = 'catppuccin',
        disabled_filetypes = {
            statusline = {
                "NvimTree"
            }
        },
        section_separators = {
            left = '', right = ''
        },
        component_separators = { left = '', right = '' },
        --component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = {
            {
                "mode",
                fmt = function(str)
                    return str
                end,
            }
        },
        lualine_b = {
            {
                'filename',
            }
        },
        lualine_c = { 'location' },
        lualine_x = { 'branch' },
        lualine_y = { 'diff' },
        lualine_z = { 'progress' }
    }
}

require('lualine').setup(opts)
