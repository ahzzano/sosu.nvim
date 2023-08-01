require('dashboard').setup {
    theme = 'doom',
    config = {
        header = require('sosu.core').header,
        center = {

            {
                desc = 'Create a buffer',
                desc_hl = 'string',
                key = 'o',
                key_hl = 'group',
                action = ':e empty buffer'
            },
            {
                desc = 'Find file',
                desc_hl = 'string',
                key = 'f',
                key_hl = 'group',
                action = ':Telescope find_files'
            },
            {
                desc = 'Update Plugins',
                desc_hl = 'string',
                key = 'l',
                key_hl = 'group',
                action = ':Lazy'
            },
            {
                desc = 'Install LSP',
                desc_hl = 'string',
                key = 'm',
                key_hl = 'group',
                action = ':Mason'
            },
            {
                desc = 'Quit',
                desc_hl = 'string',
                key = 'q',
                key_hl = 'group',
                action = ':q'
            }

        }

    }
}
