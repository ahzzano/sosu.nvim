function SetColorscheme(color)
    color = color or "everforest"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
