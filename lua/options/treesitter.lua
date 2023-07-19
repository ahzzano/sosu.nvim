require('nvim-treesitter.configs').setup{
	ensure_installed = {'c', 'cpp', 'rust', 'python', 'typescript', 'vue', 'make', 'html', 'javascript'},
	auto_install = true,
    autotag = {
        enable=true
    },
	highlight = {
		enable=true
	}

}
