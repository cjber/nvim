---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  lsp_semantic_tokens = true,

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    icons = true,
    lspkind_text = false,
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

  nvdash = {
    load_on_startup = false,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      -- { "  Themes", "Spc t h", "Telescope themes" },
      -- { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.lazy_nvim = {
  performance = {
    rtp = {
      disabled_plugins = vim.tbl_filter(function(name)
        return string.sub(name, 1, 7) ~= "rplugin"
      end, require("plugins.configs.lazy_nvim").performance.rtp.disabled_plugins),
    },
  },
}

return M
