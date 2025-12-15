-- 使用 tab 方式实现窗口最大化/恢复
-- 原理：最大化时在新 tab 打开当前 buffer，恢复时关闭 tab
return {
  dir = ".",
  name = "window-zoom",
  keys = {
    {
      "<C-w>z",
      function()
        if vim.t.zoomed_win then
          -- 恢复：关闭当前 tab
          vim.cmd("tabclose")
        else
          -- 最大化：在新 tab 打开当前 buffer
          vim.cmd("tab split")
          vim.t.zoomed_win = true
        end
      end,
      mode = { "n", "t" },
      desc = "Toggle window zoom",
    },
  },
}
