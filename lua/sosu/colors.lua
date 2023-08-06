function SetColorscheme(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
