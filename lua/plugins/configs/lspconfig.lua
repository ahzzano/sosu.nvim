require('neodev').setup()

local lsp = require('lsp-zero').preset()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local kind_icons = require('sosu.core').lspicons

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
end)

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.skip_server_setup({ 'rust_analyzer' })

local function format(_, vim_item)
    print('hello')
    vim_item.kind = " " .. kind_icons[vim_item.kind] .. " " or ""
    return vim_item
end

lsp.setup()

require('luasnip.loaders.from_vscode').lazy_load()

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
local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>vca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    }
})
