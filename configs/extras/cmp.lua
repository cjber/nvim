local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
  opts = function()
    local opts = require "plugins.configs.cmp"
    local cmp = require "cmp"

    opts.completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    }
    table.insert(opts.sources, { name = "nvim_lsp_signature_help" })
    table.insert(opts.sources, { name = "copilot" })

    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }

    return opts
  end,
}

return spec
