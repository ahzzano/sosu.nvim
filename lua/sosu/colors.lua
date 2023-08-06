function SetColorscheme(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
