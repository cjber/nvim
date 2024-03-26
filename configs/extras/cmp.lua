local spec = {
  "hrsh7th/nvim-cmp",
  opts = function()
    local opts = require "plugins.configs.cmp"
    local cmp = require "cmp"

    opts.completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    }

    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    opts.view = { docs = { auto_open = false } }

    opts.sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
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
