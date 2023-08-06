local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

local kind_icons = require('sosu.core').lspicons
local function format(_, vim_item)
    print('hello')
    vim_item.kind = " " .. kind_icons[vim_item.kind] .. " " or ""
    return vim_item
end

cmp.setup({
    formatting = {
        fields = { "kind", "abbr" },
        format = format,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    },
})
