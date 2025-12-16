-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ~/.config/nvim/lua/config/keymaps.lua

-- Cmd+E 最近文件（类似 IDEA）
vim.keymap.set("n", "<D-e>", function() Snacks.picker.recent() end, { desc = "Recent Files" })
