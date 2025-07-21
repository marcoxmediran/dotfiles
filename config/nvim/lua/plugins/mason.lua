return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({})
      mason_lspconfig.setup({})
      mason_tool_installer.setup({
        ensure_installed = {
          "bash-language-server",
          "blade-formatter",
          "clang-format",
          "clangd",
          "cpplint",
          "intelephense",
          "jdtls",
          "lua-language-server",
          "marksman",
          "pint",
          "prettier",
          "pyright",
          "shfmt",
          "stylua",
          "tailwindcss-language-server",
          "typescript-language-server",
          "vue-language-server",
        },
      })

      -- Binds
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
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
          null_ls.builtins.formatting.blade_formatter,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.pint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
          require("none-ls.diagnostics.cpplint"),
        },
      }) -- Binds
      vim.keymap.set("n", "<leader>gf", function()
        vim.lsp.buf.format({ timeout_ms = 5000 })
      end, {})
    end,
  },
}
