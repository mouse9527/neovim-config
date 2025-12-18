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
    -- 退出 visual 模式
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  end

  -- 计算相对于 pwd 的路径
  local cwd = vim.fn.getcwd()
  local prefix = cwd .. "/"
  local relative_path
  if file_path:sub(1, #prefix) == prefix then
    relative_path = file_path:sub(#prefix + 1)
  else
    relative_path = file_path
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      local chan = vim.b[buf].terminal_job_id
      if chan then
        local content = " @" .. relative_path .. suffix .. " "
        vim.api.nvim_chan_send(chan, content)
        vim.notify("Sent to Claude:\n" .. content)

        -- 跳转到终端窗口并保持 normal 模式
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_buf(win) == buf then
            vim.api.nvim_set_current_win(win)
            vim.cmd("stopinsert")
            break
          end
        end

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
