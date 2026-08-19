local header = [[
__  ___           _    _    ________  ___   __  ___           __    _
   /  |/  /___ __  __(_)  | |  / /  _/  |/  /  /  |/  /___ ______/ /_  (_)___  ___
  / /|_/ / __ `/ |/_/ /   | | / // // /|_/ /  / /|_/ / __ `/ ___/ __ \/ / __ \/ _ \
 / /  / / /_/ />  </ /    | |/ // // /  / /  / /  / / /_/ / /__/ / / / / / / /  __/
/_/  /_/\__,_/_/|_/_/     |___/___/_/  /_/  /_/  /_/\__,_/\___/_/ /_/_/_/ /_/\___/
]]

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = header,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
            },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header", padding = 1 },
          { icon = " ", title = "Actions", section = "keys", indent = 2, gap = 1, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, limit = 5, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
