return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			extensions = {
			fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",
			}
		}
		},
		cmd = "Telescope",
		keys = {
		  { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
		  { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
		  { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
		  { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
		},
	},
	{
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },
}
