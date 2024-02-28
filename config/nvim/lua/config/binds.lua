local vim = vim

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-K>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-J>", function() harpoon:list():next() end)
