return {
  "keaising/im-select.nvim",
  event = "InsertEnter",
  opts = {
    -- 指定 im-select 完整路径
    default_command = "/opt/homebrew/bin/im-select",

    -- 英文输入法标识符（macOS 常见值）
    -- 如果不对，切换到英文后终端运行 im-select 查看
    default_im_select = "com.apple.keylayout.ABC",

    -- 退出插入模式时切换到英文
    set_default_events = { "InsertLeave", "FocusGained" },

    -- 进入插入模式时恢复之前的输入法（可选）
    -- set_previous_events = { "InsertEnter" },
  },
}
