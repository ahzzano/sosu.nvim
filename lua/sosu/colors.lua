function SetColorscheme(color)
    -- color = color or "tokyonight-night"
    -- color = color or "gruvbox-material"
    color = color or "onedark"
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
