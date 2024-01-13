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
    { "mrcjkb/rustaceanvim", ft = { "rust" } },
  },
  ensure_installed = {
    "bashls",
    "gopls",
    "lua_ls",
    "pylsp",
    "tsserver",
  },
  automatic_installation = true,
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "]c", "<cmd>lua vim.diagnostic.goto_next()<CR>")
    vim.keymap.set("n", "[c", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    local lspconfig = require("lspconfig")
    vim.g.rustaceanvim = {
      server = {
        capabilities = capabilities,
      },
    }

    lspconfig["html"].setup({
      capabilities = capabilities,
    })

    lspconfig["gopls"].setup({
      capabilities = capabilities,
    })

    lspconfig["jsonls"].setup({
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

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
    })
  end,
}
