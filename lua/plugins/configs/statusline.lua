local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local catppuccin = require "lualine.themes.catppuccin"

for key, value in pairs(catppuccin) do
    value.z = { bg = macchiato.green, fg = macchiato.surface0 }
end

local function get_lsp()
    if next(vim.lsp.get_active_clients()) == nil then
        return "[No LSP Attached]"
    end
    return vim.lsp.get_active_clients()[1].name
end

-- LUA LINE
local opts = {
    icons_enabled = true,
    options = {
        theme = 'auto',
        disabled_filetypes = {
            statusline = {
                "NvimTree"
            }
        },
        section_separators = {
            left = '', right = ''
        },
        component_separators = { left = '', right = '' },
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
        lualine_x = { get_lsp },
        lualine_y = { 'branch', 'diff' },
        lualine_z = { 'progress' }
    }
}

require('lualine').setup(opts)
