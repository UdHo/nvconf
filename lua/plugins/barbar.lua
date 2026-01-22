return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
    -- invert colors of selected tab.
    vim.g.barbar_selected_invert = false
  end,
  opts = {}
}
