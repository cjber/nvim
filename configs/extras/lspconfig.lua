local spec = {
  "neovim/nvim-lspconfig",
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
    require("core.utils").load_mappings "lspconfig"
  end,
}

return spec
