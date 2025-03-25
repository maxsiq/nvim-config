return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
	require('oil').setup {
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
		view_options = {
			is_hidden_file = function(name, bufnr)
				return name ~= ".." and vim.startswith(name, ".")
			end,
		},
	}
  end
}
