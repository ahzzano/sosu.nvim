local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local kind_icons = require('sosu.core').lspicons


local cmp_keymaps = {
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1

        if cmp.visible() then
            cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
        else
            cmp.complete()
        end
    end, { 'i', 's' }),
}

local function format(_, vim_item)
    print('hello')
    vim_item.kind = " " .. kind_icons[vim_item.kind] .. " " or ""
    -- vim_item.kind = (kind_icons[vim_item.kind] or '') .. vim_item.kind

    return vim_item
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert(cmp_keymaps),

    formatting = {
        fields = { "kind", "abbr" },
        format = format,
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' }
        },
        {
            name = 'buffer'
        }
    )
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
