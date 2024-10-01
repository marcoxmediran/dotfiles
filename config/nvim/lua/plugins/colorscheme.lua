return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      -- vim.opt.termguicolors = true
      -- vim.g.gruvbox_material_better_performance = 1
      -- vim.g.gruvbox_material_enable_italic = true
      -- vim.g.gruvbox_material_enable_bold = true
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_transparent_background = 2
      -- vim.cmd("colorscheme gruvbox-material")
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.opt.termguicolors = true
      vim.cmd("colorscheme mengubones")
    end,
  },
}
