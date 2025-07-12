return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      pickers
        .new({}, {
          prompt_title = "Harpoon",
          finder = finders.new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            local function delete_entry()
              local selection = action_state.get_selected_entry()
              if not selection then
                return
              end

              -- Find index and remove from harpoon list
              for i, item in ipairs(harpoon_files.items) do
                if item.value == selection[1] then
                  harpoon_files:remove_at(i)
                  break
                end
              end

              actions.close(prompt_bufnr)

              -- Reopen the picker to reflect changes
              vim.schedule(function()
                toggle_telescope(harpoon:list())
              end)
            end

            map("i", "<C-d>", delete_entry)
            map("n", "dd", delete_entry)

            return true
          end,
        })
        :find()
    end

    -- Binds
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>e", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
    vim.keymap.set("n", "<C-K>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-J>", function()
      harpoon:list():next()
    end)
  end,
}
