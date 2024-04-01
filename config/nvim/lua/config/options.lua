local vim = vim

-- Colors
vim.opt.termguicolors = true
vim.cmd "colorscheme gruvbox-material"

-- General Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true

-- Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Startup Commands
vim.cmd "Oil"
