-- LUA LINE
local opts = {
    icons_enabled = true,
    options = {
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
        lualine_b = {
            {
                'filetype',
                icon_only = true,
                colored = false,
                icon = {
                    align = 'right'
                }
            },
            {
                'filename',
            }
        },
        lualine_c = { 'branch' },
        lualine_x = { 'location' },
        lualine_y = { 'diff' },
        lualine_z = { 'progress' }
    }
}

require('lualine').setup(opts)
