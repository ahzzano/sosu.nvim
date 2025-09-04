local cmp = require 'cmp'

local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip.loaders.from_lua').lazy_load({paths=vim.fn.stdpath('config')..'/snippets'})
luasnip.setup()

local kind_icons = require('sosu.core').lspicons
local function format(_, vim_item)
    -- vim_item.kind = " " .. kind_icons[vim_item.kind] .. " " or ""
    vim_item.kind = string.format(' %s ', kind_icons[vim_item.kind])
    return vim_item
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function super_tab(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end

function ssuper_tab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

function csuper_tab(fallback)
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    else
        fallback()
    end
end

cmp.setup({
    view = {
        entries = 'native_menu'
    },
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "abbr", "kind" },
        format = format,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'crates' }
    },
    mapping = {
        -- ['<Tab>'] = cmp_action.tab_complete(),
        ['<Tab>'] = cmp.mapping(super_tab, { 'i', 's' }),
        -- ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<S-Tab>'] = cmp.mapping(ssuper_tab, { 'i', 's' }),
        ['<C-Tab>'] = cmp.mapping(csuper_tab, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), {'i', 'c'}),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    }
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

