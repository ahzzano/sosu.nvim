-- LUA LINE
local opts = {
    icons_enabled = true,
    disabled_filetypes = {
        'NVimTree'
    },
    disabled_buftypes = { 'NvimTree' },
    options = {
        section_separators = {
            left='', right=''
        },
        component_separators = { left = '', right = '' }
   }
}

require('lualine').setup(opts)
