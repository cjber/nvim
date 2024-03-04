local spec = {
  "hrsh7th/nvim-cmp",
  opts = function()
    local opts = require "plugins.configs.cmp"
    local cmp = require "cmp"

    opts.completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    }
    table.insert(opts.sources, { name = "copilot" })

    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    opts.view = { docs = { auto_open = false } }

    -- opts.view = {
    --   entries = { name = "custom", selection_order = "near_cursor" },
    -- }

    return opts
  end,
}

return spec
