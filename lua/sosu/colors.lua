function SetColorscheme(color)
    -- color = color or "tokyonight-moon"
    -- color = color or "gruvbox-material"
    color = color or "bamboo"
    vim.g.gruvbox_material_background = 'medium'
    vim.g.gruvbox_material_foreground = 'mix'
    vim.cmd.colorscheme(color)
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
