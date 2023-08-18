function SetColorscheme(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
