return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	version = "*",
	lazy = false,
	config = function()
		require("nvim-tree").setup {}
	end,
}
