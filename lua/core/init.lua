vim.g.mapleader = " "

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.clipboard:append("unnamedplus")
opt.swapfile = false

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.lsp.inlay_hint.enable(true)
vim.keymap.set("n", "<leader>th", '<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>')

vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
