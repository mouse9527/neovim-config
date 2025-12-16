return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle dir=./<cr>", desc = "Explorer (cwd)" },
    },
    opts = {
      filesystem = {
        bind_to_cwd = true,
        cwd_target = {
          sidebar = "global",
        },
      },
    },
  },
}
