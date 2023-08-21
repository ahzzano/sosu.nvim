local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local catppuccin = require "lualine.themes.catppuccin"

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
    theme = 'auto',
    disabled_filetypes = {
      statusline = {
        "NvimTree"
      }
    },
    section_separators = {
      left = '',
      right = ''
      -- left = '', right = ''
    },
    component_separators = { left = '|', right = '' },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        separator = {

          left = '', right = ''
        },
        right_padding = 2,
        left_padding = 2,
      }
    },
    lualine_b = {

      'branch',
      {
        'diagnostics',

        left_padding = 2,
      }
    },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype', get_lsp },
    lualine_y = { 'progress' },
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
