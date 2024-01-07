return {
  "simrat39/rust-tools.nvim",
  config = function()
    local install_root_dir = vim.fn.stdpath("data") .. "/mason"
    local extension_path = install_root_dir .. "/packages/codelldb/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    local rt = require("rust-tools")

    rt.setup({
      tools = {
        hover_actions = {
          -- whether the hover action window gets automatically focused
          auto_focus = false,
        },
      },
      server = {
        on_attach = function(_, bufnr)
          require("dap")
          require("dapui")
          -- Hover actions
          vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          -- vim.keymap.set("n", "<Space>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        flags = {
          debounce_text_changes = 150,
        },
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              enable = true,
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
    })
  end,
}
