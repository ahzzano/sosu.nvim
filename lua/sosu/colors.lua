function SetColorscheme(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    -- local hl = vim.api.nvim_get_hl_by_name('Normal')
    -- print(hl)

    -- local hl = vim.api.nvim_get_hl(0, {
    --     name = "Normal"
    -- })
    -- local bg = hl.bg
    --
    -- local vt_err = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextError" }).fg
    -- local vt_wrn = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextWarn" }).fg
    -- local vt_inf = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextInfo" }).fg
    -- local vt_hin = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextHint" }).fg
    --
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = bg, fg = vt_err })
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = bg, fg = vt_wrn })
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = bg, fg = vt_inf })
    -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = bg, fg = vt_hin })
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
