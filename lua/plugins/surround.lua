require("nvim-surround").setup({
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
})

-- Custom keymaps (defaults disabled via vim.g.nvim_surround_no_mappings in pack-setup.lua)
vim.keymap.set("n", "sa", "<Plug>(nvim-surround-normal)", { desc = "Surround: Add around motion" })
vim.keymap.set("n", "saa", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround: Add around line" })
vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)", { desc = "Surround: Add around selection" })
vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual-line)", { desc = "Surround: Add around selection (new lines)" })
vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)", { desc = "Surround: Delete" })
vim.keymap.set("n", "sc", "<Plug>(nvim-surround-change)", { desc = "Surround: Change" })
vim.keymap.set("n", "sC", "<Plug>(nvim-surround-change-line)", { desc = "Surround: Change (new lines)" })
vim.keymap.set("n", "ss", "<Plug>(nvim-surround-normal)iw", { desc = "Surround: Add around word" })
vim.keymap.set("n", "<leader>c", "<Plug>(nvim-surround-change)b", { desc = "Surround: Change brackets" })
vim.keymap.set("n", "<leader>C", "<Plug>(nvim-surround-change)q", { desc = "Surround: Change quotes" })

vim.api.nvim_set_hl(0, 'NvimSurroundHighlight',
  { ctermbg = 'yellow', ctermfg = 'black', bg = 'Yellow', fg = 'Black', bold = true })
