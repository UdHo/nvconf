return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
  },
  config = function()
    require("trouble").setup({})
    vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
    vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end)
    vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("document_diagnostics") end)
    vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("quickfix") end)
    vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end)
  end,
}
