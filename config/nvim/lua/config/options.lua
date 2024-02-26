local vim = vim

-- Colors
vim.opt.termguicolors = true
vim.cmd "colorscheme gruvbox-material"

-- General Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true

-- Nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd "NvimTreeOpen"
vim.cmd "hi NvimTreeNormal guibg=#282828"
vim.cmd "hi NvimTreeEndOfBuffer guibg=#282828"
vim.cmd "hi NvimTreeSignColumn guibg=#282828"

