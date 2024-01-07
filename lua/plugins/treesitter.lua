return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "proto", "go", "bash" },
    })
    require("nvim-treesitter").setup({})
  end,
}
