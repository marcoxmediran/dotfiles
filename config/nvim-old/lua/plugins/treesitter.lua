return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "OXY2DEV/markview.nvim",
    "nvim-treesitter/nvim-treesitter-context",
  },
  lazy = false,
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
  end,
}
