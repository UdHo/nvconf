return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "folke/neodev.nvim",
    },
    { "neovim/nvim-lspconfig" },
    -- {
    --   'mrcjkb/rustaceanvim',
    --   version = '^6', -- Recommended
    --   lazy = false,   -- This plugin is already lazy
    -- }
  },
  ensure_installed = {
    "rust-analyzer",
    "gopls",
    "lua_ls",
    "pylsp",
    "ts_ls",
    "json-lsp"
  },
  automatic_installation = true,
  config = function()
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities()


    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

    local lspconfig = require("lspconfig")
    -- vim.g.rustaceanvim = {
    --   server = {
    --     capabilities = capabilities,
    --   },
    --   default_settings = {
    --     ['rust-analyzer'] = {
    --       imports = {
    --         granularity = { group = "module", },
    --         prefix = "self",
    --       }
    --     },
    --   },
    -- }
    --
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } },
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
    })

    lspconfig["gopls"].setup({
      capabilities = capabilities,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "use", "vim" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })

    lspconfig["pylsp"].setup({
      capabilities = capabilities,
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 100,
            },
          },
        },
      },
    })
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
    })
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
    })
    lspconfig["clangd"].setup({
      capabilities = capabilities
    })
  end,
}
