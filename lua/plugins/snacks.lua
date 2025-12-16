return {
  {
    "folke/snacks.nvim",
    opts = {
      -- 禁用 snacks terminal，使用 toggleterm
      terminal = { enabled = false },
      picker = {
        sources = {
          -- 只针对 lsp_references 配置
          lsp_references = {
            focus = "list",
            layout = {
              layout = {
                box = "vertical",
                width = 0.8,
                height = 0.85,
                border = "rounded",
                { win = "preview", height = 0.5, border = "bottom" },
                { win = "input", height = 1, border = "bottom" },
                { win = "list" },
              },
            },
          },
          -- explorer 默认 normal mode
          explorer = {
            focus = "list",
          },
        },
      },
    },
  },
}
