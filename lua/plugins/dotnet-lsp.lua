return {
  -- EasyDotnet includes the official Roslyn language server. Disable the
  -- OmniSharp server inherited from the LazyVim .NET extra so only one C# LSP
  -- owns diagnostics, completion, and navigation.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = { enabled = false },
      },
    },
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },
}
