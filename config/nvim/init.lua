--- General Options ---
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = false })

--- PLUGINS ---
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },

	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },

	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" },

	{ src = "https://github.com/fraeso/xcodedark.nvim" },

	{ src = "https://github.com/windwp/nvim-autopairs" },

	{ src = "https://github.com/nvim-flutter/flutter-tools.nvim" },

	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },

	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },

	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },

	{ src = "https://github.com/OXY2DEV/markview.nvim" },

	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/nvimtools/none-ls-extras.nvim" },

	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- Oil
local plugin_oil = require("oil")
plugin_oil.setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

-- Telescope
local plugin_telescope = require("telescope")
local plugin_telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", plugin_telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>g", plugin_telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", plugin_telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>h", plugin_telescope_builtin.help_tags, {})
plugin_telescope.setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})
plugin_telescope.load_extension("ui-select")

-- Colorscheme
local plugin_xcodedark = require("xcodedark")
plugin_xcodedark.setup({
	transparent = true,
	terminal_colors = true,
})
vim.cmd.colorscheme("xcodedark")

-- Autopairs
local plugin_autopairs = require("nvim-autopairs")
plugin_autopairs.setup({})

-- Flutter Tools
local plugin_flutter_tools = require("flutter-tools")
plugin_flutter_tools.setup({})
plugin_telescope.load_extension("flutter")
vim.keymap.set("n", "<leader>F", plugin_telescope.extensions.flutter.commands, {})

-- Mason
local plugin_mason = require("mason")
local plugin_mason_lspconfig = require("mason-lspconfig")
local plugin_mason_tool_installer = require("mason-tool-installer")
local plugin_null_ls = require("null-ls")
plugin_mason.setup({})
plugin_mason_lspconfig.setup({})
plugin_mason_tool_installer.setup({
	ensure_installed = {
		"clangd",
		"clang-tidy",
		"clang-format",
		"google-java-format",
		"jdtls",
		"lua-language-server",
		"stylua",
	},
})
plugin_null_ls.setup({
	sources = {
		plugin_null_ls.builtins.formatting.clang_format,
		plugin_null_ls.builtins.formatting.stylua,
		plugin_null_ls.builtins.formatting.google_java_format,
	},
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", function()
	vim.lsp.buf.format({ timeout_ms = 5000 })
end, {})

-- Harpoon
local plugin_harpoon = require("harpoon")
plugin_harpoon:setup()
vim.keymap.set("n", "<leader>a", function()
	plugin_harpoon:list():add()
end)
vim.keymap.set("n", "<leader>e", function()
	plugin_harpoon.ui:toggle_quick_menu(plugin_harpoon:list())
end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-K>", function()
	plugin_harpoon:list():prev()
end)
vim.keymap.set("n", "<C-J>", function()
	plugin_harpoon:list():next()
end)

-- Completions
local plugin_cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
plugin_cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = plugin_cmp.config.window.bordered(),
		documentation = plugin_cmp.config.window.bordered(),
	},
	mapping = plugin_cmp.mapping.preset.insert({
		["<C-b>"] = plugin_cmp.mapping.scroll_docs(-4),
		["<C-f>"] = plugin_cmp.mapping.scroll_docs(4),
		["<C-Space>"] = plugin_cmp.mapping.complete(),
		["<C-e>"] = plugin_cmp.mapping.abort(),
		["<CR>"] = plugin_cmp.mapping.confirm({ select = true }),
	}),
	sources = plugin_cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Treesitter
local plugin_treesitter = require("nvim-treesitter")
plugin_treesitter.setup({})
plugin_treesitter.install({ "dart", "java", "lua", "c", "cpp" }):wait(300000)
