require('neodev').setup()

local lsp = require('lsp-zero').preset('recommended')
local cmp = require('cmp')

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

cmp.setup({
    formatting = {
        fields = { "kind", "abbr" },
        format = format,
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})
local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>vca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    }
})
