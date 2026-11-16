return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("flutter-tools").setup({})

    -- Telescope integration
    local telescope = require("telescope")
    telescope.load_extension("flutter")
    vim.keymap.set("n", "<leader>F", telescope.extensions.flutter.commands, {})
  end,
}
