require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "gopls",
    "lua_ls",
    "pylsp",
    "ts_ls",
    "jsonls"
  },
  automatic_installation = true,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.config('rust_analyzer', {
  settings = { ['rust-analyzer'] = { check = { command = 'clippy' } } },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { "use", "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 100 },
      },
    },
  },
})

vim.lsp.enable({ 'rust_analyzer', 'html', 'gopls', 'lua_ls', 'pylsp', 'ts_ls', 'jsonls', 'clangd', 'buf_ls' })
