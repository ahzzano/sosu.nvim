function SetColorscheme(color)
    color = color or "catppuccin"

    require('catppuccin').setup({
        transparent_background = true,
        highlight_overrides = {
            mocha = function(mocha)
                return {
                    TelescopeTitle = { bg = mocha.green, fg = mocha.base },
                    TelescopeNormal = { bg = mocha.mantle },
                    -- TelescopePromptNormal = { bg = mocha.crust },
                    -- TelescopePromptBorder = { bg = mocha.crust, fg = mocha.crust },
                    TelescopeBorder = { bg = mocha.mantle, fg = mocha.mantle }
                }
            end
        }
    })
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = 'none' })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
end

vim.opt.background = "dark"
SetColorscheme()

return { SetColorscheme }
