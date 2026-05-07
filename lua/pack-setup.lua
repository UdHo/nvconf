-- Must be set before plugins load (vim.pack.add sources plugin/ files)
vim.g.nvim_surround_no_mappings = true

vim.pack.add({
  -- shared dependencies
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/rafamadriz/friendly-snippets',
  -- colorscheme
  'https://github.com/navarasu/onedark.nvim',
  -- LSP
  'https://github.com/folke/neodev.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/nvimdev/lspsaga.nvim',
  -- completion
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1' },
  -- treesitter
  'https://github.com/nvim-treesitter/nvim-treesitter',
  -- UI
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/romgrk/barbar.nvim',
  'https://github.com/stevearc/aerial.nvim',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/j-hui/fidget.nvim',
  -- editing
  'https://github.com/numToStr/Comment.nvim',
  'https://github.com/kylechui/nvim-surround',
  'https://github.com/stevearc/conform.nvim',
  -- git
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
  -- search / navigation
  'https://github.com/nvim-telescope/telescope.nvim',
  -- diagnostics
  'https://github.com/folke/trouble.nvim',
  -- AI
  'https://github.com/github/copilot.vim',
  'https://github.com/CopilotC-Nvim/CopilotChat.nvim',
  -- utils
  'https://github.com/saecki/crates.nvim',
  'https://github.com/notjedi/nvim-rooter.lua',
})

require("plugins")
