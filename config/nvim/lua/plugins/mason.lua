return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Binds
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- Initialize LSP's
      vim.lsp.enable("pylsp")
      vim.lsp.enable("clangd")
      vim.lsp.enable("jdtls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("bashls")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.prettier,
          require("none-ls.diagnostics.cpplint"),
        },
      }) -- Binds
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ timeout_ms = 5000 })
      end, {})
    end,
  },
}
