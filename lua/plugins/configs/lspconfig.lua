if vim.bo.filetype == "lua" then
    require("neodev").setup()
end

local lsp = require("lsp-zero").preset()

vim.diagnostic.config({
    virtual_text = {
        prefix = " ",
        virt_text_pos = "right_align",
    },
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["null-ls"] = {
            "rust",
            "go",
            "lua",
            "html",
            "javascript",
            "typescript",
            "css",
            "c",
            "c++",
        },
    },
})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }
end)

lsp.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»",
})

lsp.skip_server_setup({ "rust_analyzer" })
lsp.configure('gdscript', {
    force_setup = true,                    -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    cmd = { 'ncat', 'localhost', '6005' }, -- the important trick for Windows!
    -- cmd = vim.lsp.rpc.connect('localhost', 6008),
    root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = { 'gd', 'gdscript', 'gdscript3' }
})
lsp.setup()
