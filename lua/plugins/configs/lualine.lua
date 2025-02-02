local function get_lsp()
    if next(vim.lsp.get_active_clients()) == nil then
        return "[No LSP Attached]"
    end
    return " " .. vim.lsp.get_active_clients()[1].name
end

-- left = '', right = ''
-- LUA LINE
local opts = {
    icons_enabled = true,
    options = {
        globalstatus = true,
        theme = 'auto',
        disabled_filetypes = {
            statusline = {
                "NvimTree",
            }
        },
        section_separators = {
            left = '',
            right = ''
        },
        component_separators = { left = '|', right = '' },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                right_padding = 2,
                left_padding = 2,
            }
        },
        lualine_b = {
            'filename'
        },
        lualine_c = {
            {
                'branch',
                icon = '',
            }
        },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {
            'filename', 'filetype'
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    }
}

require('lualine').setup(opts)
