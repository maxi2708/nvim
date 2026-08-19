return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dR",
        function()
          local ok, dapui = pcall(require, "dapui")
          if not ok then
            vim.notify("nvim-dap-ui is not loaded", vim.log.levels.WARN)
            return
          end

          dapui.update_render({})
          vim.notify("DAP variables refreshed")
        end,
        desc = "Refresh DAP variables",
      },
    },
  },
}
