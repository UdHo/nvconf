-- Note: run :TSUpdate after first install
require("nvim-treesitter").setup({
  ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "proto", "go", "bash" },
})
