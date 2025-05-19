return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
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
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.asm_lsp.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.intelephense.setup({
        capabilities = capabilities,
      })
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
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.asmfmt,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.pint,
          null_ls.builtins.formatting.blade_formatter,
          require("none-ls.diagnostics.cpplint"),
        },
      }) -- Binds
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ timeout_ms = 2000 })
      end, {})
    end,
  },
}
