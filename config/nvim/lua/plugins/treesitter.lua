return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "OXY2DEV/markview.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
  },
  lazy = false,
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
