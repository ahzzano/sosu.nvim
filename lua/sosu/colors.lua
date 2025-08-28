function SetColorscheme(color)
    color = color or "oxocarbon"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
