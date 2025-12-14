-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ~/.config/nvim/lua/config/keymaps.lua

-- Ctrl+\ Ctrl+n 是 Vim 内置的强制退出到 normal mode，在所有模式下生效
-- 以下是额外确保在各种模式下都能工作
vim.keymap.set("i", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit to normal mode" })
vim.keymap.set("v", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit to normal mode" })
vim.keymap.set("c", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit to normal mode" })
vim.keymap.set("t", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Toggle 普通终端
vim.keymap.set("n", "<leader>tb", function()
  Snacks.terminal(nil, {
    win = { position = "bottom", height = 0.3 },
    keys = {
      term_normal = false, -- 禁用 <esc> 退出终端模式
      term_hide = false, -- 禁用 <esc><esc> 隐藏终端
    },
  })
end, { desc = "Toggle terminal (bottom)" })

-- Toggle Claude CLI
vim.keymap.set("n", "<leader>tc", function()
  Snacks.terminal("claude --dangerously-skip-permissions", {
    win = { position = "bottom", height = 0.4 },
    keys = {
      term_normal = false, -- 禁用 <esc> 退出终端模式
      term_hide = false, -- 禁用 <esc><esc> 隐藏终端
    },
  })
end, { desc = "Toggle Claude CLI" })
