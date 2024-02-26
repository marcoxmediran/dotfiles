local lspconfig = require("lspconfig")

require("mason").setup {}
require("mason-lspconfig").setup({
	ensure_installed = {
		"pylsp",
	}
})

-- LSP Servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup {
	capabilities = capabilities,
}
lspconfig.pylsp.setup {
	capabilities = capabilities,
}
lspconfig.dartls.setup {
	capabilities = capabilities,
}
require("flutter-tools").setup {
	capabilities = capabilities,
}
