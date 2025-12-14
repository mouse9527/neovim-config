-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shell = "/opt/homebrew/bin/bash"

-- 确保 Homebrew 路径在 PATH 中
vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

-- 自动保存
vim.opt.autowrite = true  -- 切换 buffer 时自动保存
vim.opt.autowriteall = true  -- 更多场景自动保存

-- 可选：输入停止后自动保存（类似 IDEA）
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})
