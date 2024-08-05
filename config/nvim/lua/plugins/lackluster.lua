return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("lackluster-hack")
  end,
}
