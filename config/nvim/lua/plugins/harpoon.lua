return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Binds
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>e", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<C-K>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-J>", function()
      harpoon:list():next()
    end)
  end,
}
