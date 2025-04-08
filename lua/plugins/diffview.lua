return {
  'sindrets/diffview.nvim', -- git diff viewer
  config = function()
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>',
      { desc = "Open git DiffviewFileHistory current file" })
    vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>',
      { desc = "Open git DiffviewFileHistory working directory" })
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = "Open Diffview against current index" })
  end
}
