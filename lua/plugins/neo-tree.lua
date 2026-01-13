return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- 禁用默认的自动打开命令
    init = function()
      -- 禁用 LazyVim 的自动打开行为
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    opts = {
      -- 禁用自动打开
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
      filesystem = {
        filtered_items = {
          visible = true, -- Default to showing hidden files
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        -- 禁用在启动时跟随当前文件
        follow_current_file = {
          enabled = false,
        },
      },
      -- 禁用窗口自动调整
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            -- 防止重复打开
            vim.cmd("setlocal signcolumn=auto")
          end,
        },
      },
    },
  },
}
