-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded by LazyVim on VeryLazy.
-- Use vim.keymap.set in personal configuration.

local function map(mode, lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", {
    silent = true,
    desc = desc,
  }, opts or {})

  vim.keymap.set(mode, lhs, rhs, opts)
end

local motion_modes = { "n", "x", "o" }

-- ---------------------------------------------------------------------------
-- ISO-DE punctuation layer
-- ---------------------------------------------------------------------------

-- Universal aliases for commands beginning with [ and ].
--
-- Examples:
--   öd / äd    previous / next diagnostic
--   öe / äe    previous / next error
--   öw / äw    previous / next warning
--   öq / äq    previous / next quickfix item
--   öb / äb    previous / next buffer
--   öt / ät    previous / next TODO
--   öh / äh    previous / next Git hunk
--   öö / ää    previous / next reference
map(motion_modes, "ö", "[", "Previous prefix ([)", { remap = true })
map(motion_modes, "ä", "]", "Next prefix (])", { remap = true })

-- Native paragraph motions without AltGr+7 / AltGr+0.
map(motion_modes, "Ö", "{", "Previous paragraph ({)", { remap = true })
map(motion_modes, "Ä", "}", "Next paragraph (})", { remap = true })

-- The backtick key is a dead-key chord on ISO-DE.
-- Example: üa jumps to the exact position of mark a.
map(motion_modes, "ü", "`", "Exact mark jump (`)", { remap = true })

-- Tilde is AltGr++ on ISO-DE.
map({ "n", "x" }, "Ü", "~", "Toggle case", { remap = true })

-- Forward search becomes one unmodified key.
-- Backward search remains ? on Shift+ß, forming a natural pair.
map(motion_modes, "ß", "/", "Search forward")

-- Convenient square-bracket text objects.
-- Examples: diö, ciö, vaö
map({ "o", "x" }, "iö", "i[", "Inside square brackets")
map({ "o", "x" }, "aö", "a[", "Around square brackets")

-- For braces, the built-in text objects are already easy:
--   iB / aB    inside / around { ... }
--   ib / ab    inside / around ( ... )

-- ---------------------------------------------------------------------------
-- Window and tab aliases
-- ---------------------------------------------------------------------------

map("n", "<leader>ws", "<C-w>s", "Split window below", { remap = true })
map("n", "<leader>wv", "<C-w>v", "Split window right", { remap = true })

map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", "Previous tab")
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", "Next tab")

-- ---------------------------------------------------------------------------
-- Accessible replacements for symbol-heavy plugin bindings
-- ---------------------------------------------------------------------------

map("n", "<leader>bk", function()
  require("which-key").show({ global = false })
end, "Buffer keymaps")

map("n", "<leader>sy", function()
  Snacks.picker.registers()
end, "Registers")

map("n", "<leader>so", function()
  Snacks.picker.search_history()
end, "Search history")

-- ---------------------------------------------------------------------------
-- Macro workflow without AltGr+Q
-- ---------------------------------------------------------------------------

-- Record with qq, stop with q, execute with Q.
-- This replaces the rarely used Ex-mode Q command.
map("n", "Q", "@q", "Run macro q")

-- Repeat whichever macro ran most recently.
-- This replaces the rarely used gQ Ex-mode command.
map("n", "gQ", "@@", "Repeat last macro")

-- Apply macro q to each selected line.
map("x", "Q", ":normal @q<cr>", "Run macro q on selection")

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
