require('nvim-treesitter.configs').setup{
	ensure_installed = {'c', 'cpp', 'rust', 'python', 'typescript', 'vue', 'make', 'html', 'javascript', 'ruby'},
	auto_install = true,
	highlight = {
		enable=true
	}

}
