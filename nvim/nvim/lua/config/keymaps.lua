-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<C-M-l>", function()
  -- LazyVim.format({ force = true }
  require("conform").format({ async = true })
end, { desc = "Format" })
map("n", "<C-n>", ":Neotree toggle<cr>")
map("n", "<F2>", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<tab>", "<cmd>bnext<cr>")
-- map("n", "<leader>o", "", { desc = "+Open" })
map("n", "<leader>zf", "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", { desc = "Flutter commands" })
map("n", "<M-h>", function()
  require("nvterm.terminal").toggle("horizontal")
end, { desc = "open terminal horizontal" })

----- OIL -----
map("n", "<leader>fo", "<CMD>Oil<CR>", { desc = "Oil open parent directory" })

----- Theme selector Huez -----
map("n", "<leader>tt", "<CMD>Huez<CR>", { desc = "Theme switcher" })
