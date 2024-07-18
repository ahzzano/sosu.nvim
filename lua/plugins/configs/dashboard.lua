require('dashboard').setup {
    theme = 'doom',
    config = {
        header = require('sosu.core').header,
        center = {

            {
                icon = ' ',
                desc = 'Create a buffer',
                desc_hl = 'string',
                key = 'o',
                key_hl = 'group',
                action = ':e empty buffer'
            },
            {
                icon = ' ',
                desc = 'Find file',
                desc_hl = 'string',
                key = 'f',
                key_hl = 'group',
                action = ':Telescope find_files'
            },
            {
                icon = '󰖷 ',
                desc = 'Update Plugins',
                desc_hl = 'string',
                key = 'l',
                key_hl = 'group',
                action = ':Lazy'
            },
            {
                icon = ' ',
                desc = 'Install LSP',
                desc_hl = 'string',
                key = 'm',
                key_hl = 'group',
                action = ':Mason'
            },
            {
                icon = ' ',
                desc = 'Git',
                desc_hl = 'string',
                key = 'g',
                key_hl = 'group',
                action = ':Neogit'
            },
            {
                icon = '󰿅 ',
                desc = 'Quit',
                desc_hl = 'string',
                key = 'q',
                key_hl = 'group',
                action = ':q'
            },

        }

    }
}
