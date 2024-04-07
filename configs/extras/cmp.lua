local spec = {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
  opts = function()
    local opts = require "plugins.configs.cmp"
    local cmp = require "cmp"

    opts.completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    }

    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    opts.view = { docs = { auto_open = true } }

    opts.sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      {
        name = "path",
        option = {
          get_cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }

    return opts
  end,
}

return spec
