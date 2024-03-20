local spec = {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufNewFile", "BufWritePre" },
  lazy = true,
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        python = { "ruff_format", "ruffer", "injected" },
        -- sql = { "sqlfmt" },
        lua = { "stylua" },
      },
      formatters = {
        ruffer = {
          command = "ruff",
          args = {
            "--fix",
            "-e",
            "--target-version",
            "py312",
            "--unfixable",
            "F401,F841",
            "--extend-select",
            "ARG,B,C4,DTZ,I,S,UP",
            "--stdin-filename",
            "$FILENAME",
            "-",
          },
          stdin = true,
          cwd = require("conform.util").root_file {
            "pyproject.toml",
            "ruff.toml",
          },
        },
      },
    }
  end,
}

return spec
