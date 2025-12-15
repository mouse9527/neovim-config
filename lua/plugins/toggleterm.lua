return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-/>]],
    direction = "horizontal",
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.3
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    shade_terminals = false,
  },
  keys = {
    { "<C-/>", desc = "Toggle terminal" },
    -- Claude CLI 专用终端
    {
      "<leader>tc",
      function()
        require("toggleterm.terminal").Terminal
          :new({
            cmd = "claude --dangerously-skip-permissions",
            direction = "horizontal",
            count = 99, -- 用一个特殊的 count 来标识 Claude 终端
          })
          :toggle()
      end,
      desc = "Toggle Claude CLI",
    },
  },
}
