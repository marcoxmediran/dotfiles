return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = "light"
      vim.o.termguicolors = true
      vim.cmd("colorscheme zenbones")
    end,
  },
}
