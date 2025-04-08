return {
  "kylechui/nvim-surround", -- surround text with brackets
  event = "VeryLazy",
  opts = {
    keymaps = {
      -- insert = "<C-g>s",
      -- insert_line = "<C-g>S",
      normal = "sa",
      normal_cur = "saa",
      -- normal_line = "sA",
      -- normal_cus_line = "sAA",
      visual = "s",
      visual_line = "S",
      delete = "sd",
      change = "sc",
      change_line = "sC",
    },
    surrounds = {
      -- "function"
      ["f"] = {
        add = function()
          local config = require("nvim-surround.config")
          local result = config.get_input("Enter function name: ")
          if result then
            return { { result .. "(" }, { ")" } }
          end
        end,
        find = function()
          local config = require("nvim-surround.config")
          return config.get_selection({ pattern = "[^=%s%(%){}<>]+%b()" })
        end,
        delete = "^(.-%()().-(%))()$",
        change = {
          target = "^.-([%w_]+)()%(.-%)()()$",
          replacement = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Enter new function name: ")
            if result then
              return { { result }, { "" } }
            end
          end,
        },
      },

      -- "generic"
      ["g"] = {
        add = function()
          local config = require("nvim-surround.config")
          local result = config.get_input("Enter type name: ")
          if result then
            return { { result .. "<" }, { ">" } }
          end
        end,
        find = function()
          local config = require("nvim-surround.config")
          return config.get_selection({ pattern = "[^=%s%(%){}<>]+%b<>" })
        end,
        delete = "^(.-<)().-(>)()$",
        change = {
          target = "^(.-<)().-(>)()$",
          replacement = function()
            local config = require("nvim-surround.config")
            local result = config.get_input("Enter new type name: ")
            if result then
              return { { result .. "<" }, { ">" } }
            end
          end,
        }
      },
    },
    aliases = {
      ["b"] = { ">", ")", "]", "}" },
      ["q"] = { '"', "'", "`" },
      ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
      -- disable:
      ["("] = ")",
      ["{"] = "}",
      ["["] = "]",
      ["<"] = ">",
      ["a"] = "a",
      ["B"] = "B",
      ["r"] = "r",
    },
    move_cursor = "sticky",

    vim.keymap.set('n', 'ss', '<Plug>(nvim-surround-normal)iw', { desc = "Surround: Add bracket around word" }),
    vim.keymap.set('n', '<leader>c', '<Plug>(nvim-surround-change)b', { desc = "Surround: Change brackets" }),
    vim.keymap.set('n', '<leader>C', '<Plug>(nvim-surround-change)q', { desc = "Surround: Change quotes" }),

    vim.api.nvim_set_hl(0, 'NvimSurroundHighlight',
      { ctermbg = 'yellow', ctermfg = 'black', bg = 'Yellow', fg = 'Black', bold = true }),
  },
}
