return {
  'nvimdev/lspsaga.nvim', -- LSP UI, code actions, preview for definiton, type definition, references, implementation, rename, diagnostic, etc. also: top status line
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- symbol_in_winbar = {
    --   folder_level = 0,
    -- },
    --
    lightbulb = {
      enable = false,
    },

    code_action = {
      keys = {
        quit = { '<Esc>', 'q' },
        exec = '<Cr>',
      },
    },
    definition = {
      keys = {
        edit = '<Cr>',
        vsplit = 'v',
        tabe = 't',
        quit = '<Esc>',
        close = 'q',
      }
    },
    finder = {
      default = 'def+tyd+ref+imp',
      keys = {
        edit = '<Cr>',
        vsplit = 'v',
        tabe = 't',
        quit = { '<Esc>', 'q' },
      }
    },
    rename = {
      in_select = false,
      auto_save = true,
      keys = {
        quit = { '<Esc><Esc>', '<C-c>' },
        exec = '<Cr>',
        select = 'x',
      },
    },
    beacon = {
      frequency = 15,
    },
    diagnostic = {
      -- extend_relatedInformation = true,
      keys = {
        quit = { '<Esc>', 'q', '<C-c>' },
      }
    },
    vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = "LSP: Code action" }),
    vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder ref<CR>', { desc = "LSP: List references" }),
    vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>A', { desc = "LSP: Rename" }),
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "LSP: Previous diagnostic" }),
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "LSP: Next diagnostic" }),


    vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>"),
    vim.keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>"),
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>"),
  },
}
