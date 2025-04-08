return {
  'stevearc/aerial.nvim', -- sidebar for functions, classes, etc on the right side
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      -- on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        -- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        -- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      -- end, -- deactivates as there where conflics with vim-visual-multi this way
      layout = { placement = "edge" },
      close_automatic_events = { "unfocus", "switch_buffer" },
      autojump = true,
      close_on_select = true,
      vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>AerialToggle<CR>"),
      vim.keymap.set("i", "<C-a>", "<Esc><cmd>AerialToggle<CR>"),
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>"),
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>")
    })
  end,
}
