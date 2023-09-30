---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyodark",
  lsp_semantic_tokens = true,

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_dark",
    selected_item_bg = "simple",
  },

  telescope = { style = "borderless" },

  statusline = {
    theme = "minimal",
    separator_style = "block",
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      table.remove(modules, 1)
    end,
  },
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
