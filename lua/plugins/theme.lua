return {
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			background = {
				light = "latte",
			},
		},
	},
	-- monokai pro octagon
	{
		"loctvl842/monokai-pro.nvim",
		priority = 1000,
		opts = {
			filter = "octagon",
		},
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme monokai-pro]])
		end,
	},
}
