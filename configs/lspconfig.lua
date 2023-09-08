local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.diagnostic.config {
  virtual_text = false,
}

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pylsp", "ltex", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ltex.setup {
  filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "quarto" },
  settings = {
    ltex = {
      additionalRules = { enablePickyRules = true },
      disabledRules = {
        ["en-GB"] = { "OXFORD_SPELLING_Z_NOT_S", "MORFOLOGIK_RULE_EN_GB", "ELLIPSIS" },
      },
      language = "en-GB",
      checkfrequency = "save",
    },
  },
}

-- lspconfig.pyright.setup {
--   settings = {
--     python = {
--       analysis = {
--         diagnosticMode = "openFilesOnly",
--         useLibraryCodeForTypes = true,
--         typeCheckingMode = "off",
--       },
--     },
--   },
-- }

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        pydocstyle = { enabled = false },
        pylint = { enabled = false },
      },
    },
  },
}
