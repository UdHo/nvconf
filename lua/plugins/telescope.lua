return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>sb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>ss", builtin.lsp_workspace_symbols, {})

    require("telescope").setup({})
  end,
}
