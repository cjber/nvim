local spec = {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufNewFile", "BufWritePre" },
  lazy = true,
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        python = { "isort", "black", "injected" },
        sql = { "sqlfmt" },
        lua = { "stylua" },
        javascript = { "prettier" },
      },
    }
  end,
}

return spec
