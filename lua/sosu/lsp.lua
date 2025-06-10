vim.diagnostic.config({
    virtual_text = {
        prefix = "",
        virt_text_pos = "eol",
    },
    inlay_hints = {
        enable = true
    },
    float = true,
    signs = {
        text = {

            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "󰄛",
            [vim.diagnostic.severity.INFO] = "»",
        }
    }
})
