require('aerial').setup({
  layout = { placement = "edge" },
  close_automatic_events = { "unfocus", "switch_buffer" },
  autojump = true,
  close_on_select = true,
})

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>AerialToggle<CR>")
vim.keymap.set("i", "<C-a>", "<Esc><cmd>AerialToggle<CR>")
vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>")
vim.keymap.set("n", "}", "<cmd>AerialNext<CR>")
