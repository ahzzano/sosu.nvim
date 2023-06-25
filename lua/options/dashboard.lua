require('dashboard').setup {
	theme = 'doom',
	config = {
		header = {
			[[]],
			[[]],
			[[]],
			[[]]
[[                                        ]],
[[                  ;kOl.                 ]],
[[                 cXMMWx.                ]],
[[                '0MMMMWl                ]],
[[  .ldo:.   ..''..lKWMNx,.','.    ,ldd,  ]],
[[  .lNMNo,lxkkkOOOdolllokkOOOkkd;:KMWk.  ]],
[[    ':o0Kd;...'',ol. ,d:'''..,lOXxc;.   ]],
[[     .kK: .oOKOd,      .ckK0x; .kK:     ]],
[[     cNo .kWM0:.        .'xWMX; ,Kk.    ]],
[[   ..dWl .dNMd            ;KW0, '0O,..  ]],
[[ .l0xkNk..c0WK;          .xNXd. cNOd0x' ]],
[[  .'..xNx,'',clc'      .;ll;'''lXK;.'.  ]],
[[      .xNKl'   .'.     ..   .:kN0;      ]],
[[        ;kXXko;.        .,cxKX0l.       ]],
[[          .cxKNXOl.  .:xKNNOo,.         ]],
[[             .,lONKdlkNKd:.             ]],
[[                 :0WMXo.                ]],
[[                  'x0c                  ]],
[[                    .                   ]],
[[]],
[[]],
[[]],
[[]],
[[]],
		},
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
				desc = 'Quit',
				desc_hl = 'string',
				key = 'q',
				key_hl = 'group',
				action = ':q'
			}

		}

	}
}
