return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "typescript", "svelte", "html", "css" },
      highlight = { enable = true },
      indent = { enable = true },
      autoinstall = true,
    })
  end,
}
