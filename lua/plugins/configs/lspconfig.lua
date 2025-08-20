if vim.bo.filetype == "lua" then
    require("neodev").setup()
end

require('mason').setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        'biome', 'ts_ls', 'tailwindcss', 'lua_ls'
    },
})
