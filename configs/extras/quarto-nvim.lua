local spec = {
  "quarto-dev/quarto-nvim",
  dependencies = { "jmbuhr/otter.nvim" },
  ft = "quarto",
  config = function()
    require("quarto").setup {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        languages = { "r", "python", "julia", "bash" },
        chunks = "curly", -- 'curly' or 'all'
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "<C-k>",
        definition = "gd",
        rename = "<leader>lr",
        references = "gr",
      },
    }
  end,
}

return spec
