return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp' },

    	auto_install = false,

    	highlight = { enable = true },

    	indent = { enable = true },
	}
}
