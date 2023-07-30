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
        component_separators = { left = '', right = '' }
    }
}

require('lualine').setup(opts)
