return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.default_format_opts = opts.default_format_opts or {}

      -- Important:
      -- Do NOT let LSPs like jsonls format when Prettier is not configured.
      -- This prevents "VS Code vs LazyVim" formatting differences.
      opts.default_format_opts.lsp_format = "never"

      -- Use Prettier for the same kind of files most VS Code web projects use it for.
      local prettier_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
        "vue",
        "astro",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "markdown.mdx",
        "graphql",
      }

      for _, ft in ipairs(prettier_filetypes) do
        opts.formatters_by_ft[ft] = { "prettier" }
      end
    end,
  },
}
