return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        prettier = {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true,
        },
        stylua = {
          exe = "stylua",
          args = { "-" },
          stdin = true,
        },
        isort = {
          exe = "isort",
          args = { "-" },
          stdin = true,
        },
        black = {
          exe = "black",
          args = { "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })
  end,
}
