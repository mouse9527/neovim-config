return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Default to showing hidden files
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
