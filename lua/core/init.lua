vim.g.mapleader = " "

local opt = vim.opt -- for conciseness

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
