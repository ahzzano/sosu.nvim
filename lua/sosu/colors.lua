function SetColorscheme(color)
    color = color or "oxocarbon"
    vim.cmd.colorscheme(color)
    vim.cmd(":hi statusline guibg=NONE")
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
