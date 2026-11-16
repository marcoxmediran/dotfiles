return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local live_preview = require("live-preview")
    live_preview.setup({
      port = 5500,
      sync_scroll = true,
      picker = "telescope",
    })
  end,
}
