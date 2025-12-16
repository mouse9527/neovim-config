-- 在加载任何插件之前设置 JAVA_HOME
vim.env.JAVA_HOME = "/opt/homebrew/opt/openjdk@21"

return {
  {
    "mfussenegger/nvim-jdtls",
  },
}
