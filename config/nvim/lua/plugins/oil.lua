return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    require("oil").setup()
    -- Binds
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })
  end,
}
