local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

vim.diagnostic.config { virtual_text = false, float = { source = "if_many" } }

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- python
  -- "pyright",
  "pyright",
  "sourcery",
  "ruff",
  -- "pylsp",

  -- quarto
  "ltex",

  -- bash
  "bashls",

  -- sql
  "sqlls",

  -- docker
  "dockerls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ltex.setup {
  filetypes = { "tex", "quarto", "markdown" },
  settings = {
    ltex = {
      additionalRules = { enablePickyRules = true, languageModel = "~/.ngram/" },
      disabledRules = {
        ["en-GB"] = { "OXFORD_SPELLING_Z_NOT_S", "MORFOLOGIK_RULE_EN_GB" },
      },
      language = "en-GB",
      checkfrequency = "save",
    },
  },
}

local on_attach = function(client, bufnr)
  if client.name == "ruff" then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

lspconfig.pyright.setup {
  settings = {
    pyright = {
      disableOrganizeImportrs = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
      },
    },
  },
}

-- lspconfig.basedpyright.setup {
--   settings = {
--     basedpyright = {
--       typeCheckingMode = "standard",
--     },
--   },
-- }
