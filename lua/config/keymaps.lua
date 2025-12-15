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

-- Claude CLI 终端配置
local claude_term = nil
local claude_height = 0.4

-- Toggle Claude CLI (可收起/展开)
vim.keymap.set({ "n", "t" }, "<leader>tc", function()
  claude_term = Snacks.terminal("claude --dangerously-skip-permissions", {
    win = { position = "bottom", height = claude_height },
    keys = {
      term_normal = false, -- 禁用 <esc> 退出终端模式
      term_hide = false, -- 禁用 <esc><esc> 隐藏终端
    },
  })
end, { desc = "Toggle Claude CLI" })

-- Claude 终端全屏/恢复 (在 normal 和 terminal 模式下都可用)
vim.keymap.set({ "n", "t" }, "<leader>tz", function()
  if claude_term and claude_term:valid() then
    -- 切换高度：0.4 <-> 0.95 (接近全屏)
    if claude_height < 0.9 then
      claude_height = 0.95
    else
      claude_height = 0.4
    end
    -- 重新调整窗口大小
    local win = claude_term.win
    if win then
      vim.api.nvim_win_set_height(win, math.floor(vim.o.lines * claude_height))
    end
  end
end, { desc = "Toggle Claude terminal fullscreen" })
