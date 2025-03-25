return {
  'gorbit99/codewindow.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup({
      auto_enable = false,  -- Don't auto-enable on startup
      width = 10,  -- Set a specific width
      show_cursor = true,  -- Show the cursor position
      window_border = "single",
      z_index = 45,
      events = {  -- Specify events that trigger minimap updates
        "BufEnter",
        "BufWrite",
        "CursorHold",
        "CursorMoved",
        "InsertLeave",
      },
    })

    -- Set up keymaps explicitly
    vim.keymap.set('n', '<leader>mm', function()
      codewindow.toggle_minimap()
    end)

    vim.keymap.set('n', '<leader>mf', function()
      codewindow.toggle_focus()
    end)
  end,
}
