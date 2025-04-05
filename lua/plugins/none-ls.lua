return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "eslint_d", "stylua", "prettier", "isort", "black", "jq" },
      })
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black,
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
