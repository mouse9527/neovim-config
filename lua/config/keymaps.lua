-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ~/.config/nvim/lua/config/keymaps.lua

-- Cmd+E 最近文件（类似 IDEA）
vim.keymap.set("n", "<D-e>", function() Snacks.picker.recent() end, { desc = "Recent Files" })


-- 普通模式：只发文件
-- 可视模式：发文件 + 行号范围
local function send_to_claude_modules()
  local file_path = vim.fn.expand("%:p")
  if file_path == "" then
    vim.notify("No file path", vim.log.levels.WARN)
    return
  end

  local mode = vim.fn.mode()
  local suffix = ""

  -- 只有在可视模式下，才带行号
  if mode == "v" or mode == "V" then
    local l1 = vim.fn.line("v")
    local l2 = vim.fn.line(".")
    local start_line = math.min(l1, l2)
    local end_line = math.max(l1, l2)
    suffix = "#L" .. start_line .. "-" .. end_line
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      local chan = vim.b[buf].terminal_job_id
      if chan then
        vim.api.nvim_chan_send(
          chan,
          "@modules" .. file_path .. suffix .. "\n"
        )
        vim.notify("Sent to Claude:\n@modules" .. file_path .. suffix)
        return
      end
    end
  end

  vim.notify("No terminal found", vim.log.levels.ERROR)
end

-- 普通模式 + 可视模式都可用
vim.keymap.set(
  { "n", "v" },
  "<leader>cp",
  send_to_claude_modules,
  { desc = "Send to Claude (@modules, visual adds lines)" }
)
