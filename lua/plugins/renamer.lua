return {
  "filipdutescu/renamer.nvim",
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>rn",
      '<cmd>lua require("renamer").rename()<cr>',
      { noremap = true, silent = true }
    )
    require("renamer").setup({})
  end,
}
