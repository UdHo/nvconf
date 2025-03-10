return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require('onedark').setup({ style = 'deep' })
      vim.cmd([[colorscheme onedark]])
    end
  }
  -- {
  --   "rmehri01/onenord.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme onenord]])
  --   end,
  --   opts = ...
  -- }
  --
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme gruvbox]])
  --   end,
  --   opts = ...
  -- }
  -- {
  --     "rebelot/kanagawa.nvim",
  --     priority = 1000,
  --     config = function()
  --       require('kanagawa').setup({
  --         compile = false,  -- enable compiling the colorscheme
  --         undercurl = true, -- enable undercurls
  --         commentStyle = { italic = true },
  --         functionStyle = {},
  --         keywordStyle = { italic = true },
  --         statementStyle = { bold = true },
  --         typeStyle = {},
  --         transparent = false,   -- do not set background color
  --         dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  --         terminalColors = true, -- define vim.g.terminal_color_{0,17}
  --         colors = {             -- add/modify theme and palette colors
  --           palette = {},
  --           theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  --         },
  --         overrides = function(colors) -- add/modify highlights
  --           return {}
  --         end,
  --         theme = "wave",  -- Load "wave" theme when 'background' option is not set
  --         background = {   -- map the value of 'background' option to a theme
  --           dark = "wave", -- try "dragon" !
  --           light = "lotus"
  --         },
  --       })
  --
  --       vim.cmd("colorscheme kanagawa")
  --     end,
  --   }
}
