return {
  "GustavEikaas/easy-dotnet.nvim",
  cmd = "Dotnet",
  ft = { "cs", "razor", "cshtml" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    picker = "telescope",
    lsp = {
      -- Preloading calls vim.lsp.start() from the current buffer. When a
      -- restored session is on a .csproj file, Roslyn gets attached to XML
      -- and rejects every textDocument request with -30099.
      preload_roslyn = false,
    },
    debugger = {
      engine = "dncdbg",
      auto_register_dap = true,
    },
  },
  keys = {
    -- Solution
    {
      "<leader>Cs",
      function()
        require("easy-dotnet").solution_select()
      end,
      desc = "C#: Select Solution",
    },
    {
      "<leader>Cz",
      function()
        require("easy-dotnet").reset()
      end,
      desc = "C#: Reset Saved Selections",
    },

    -- Run / debug with project + launch-profile picker
    -- (project picker only shows when the solution has 2+ runnable projects)
    {
      "<leader>Cr",
      function()
        require("easy-dotnet").run_profile()
      end,
      desc = "C#: Run Project + Profile",
    },
    {
      "<leader>Cd",
      function()
        require("easy-dotnet").debug_profile()
      end,
      desc = "C#: Debug Project + Profile",
    },

    -- Non-profile pickers (project only, no launch profile)
    {
      "<leader>CR",
      function()
        require("easy-dotnet").run()
      end,
      desc = "C#: Run Project",
    },
    {
      "<leader>CD",
      function()
        require("easy-dotnet").debug()
      end,
      desc = "C#: Debug Project",
    },

    -- Attach debugger
    {
      "<leader>Ca",
      function()
        require("easy-dotnet").debug_attach()
      end,
      desc = "C#: Attach Debugger",
    },

    -- Watch
    {
      "<leader>Cw",
      function()
        require("easy-dotnet").watch()
      end,
      desc = "C#: Watch Project",
    },

    -- Build
    {
      "<leader>Cb",
      function()
        require("easy-dotnet").build_solution_quickfix()
      end,
      desc = "C#: Build Solution (quickfix)",
    },
    {
      "<leader>CB",
      function()
        require("easy-dotnet").build_quickfix()
      end,
      desc = "C#: Build Selected Project (quickfix)",
    },

    -- Tests
    {
      "<leader>Ct",
      function()
        require("easy-dotnet").testrunner()
      end,
      desc = "C#: Test Runner",
    },
    {
      "<leader>CT",
      function()
        require("easy-dotnet").test_solution()
      end,
      desc = "C#: Test Solution",
    },

    -- Terminal / stop
    {
      "<leader>Co",
      function()
        require("easy-dotnet").terminal_toggle()
      end,
      desc = "C#: Toggle Output",
    },
    {
      "<leader>Cx",
      function()
        require("easy-dotnet").stop()
      end,
      desc = "C#: Stop Running Sessions",
    },

    -- Diagnostics / LSP
    {
      "<leader>Ce",
      function()
        require("easy-dotnet").build_solution_quickfix()
      end,
      desc = "C#: Build Solution Errors",
    },
    {
      "<leader>Cl",
      function()
        require("easy-dotnet").lsp_restart()
      end,
      desc = "C#: Restart Roslyn",
    },
  },
  config = function(_, opts)
    require("easy-dotnet").setup(opts)
  end,
}
