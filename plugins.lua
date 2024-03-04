local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- base overrides
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "nvim-telescope/telescope.nvim", opts = overrides.telescope },

  -- extra plugins
  { "smoka7/hop.nvim", event = "VeryLazy", opts = {} },
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
  { "kazhala/close-buffers.nvim", event = "VeryLazy", opts = {} },

  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup { sinlent_chdir = true, detection_methods = { "pattern" } }
    end,
  },

  { "dgagn/diagflow.nvim", event = "LspAttach", opts = {} },

  -- imports
  { import = "custom.configs.extras.cmp" },
  { import = "custom.configs.extras.yarepl" },
  { import = "custom.configs.extras.lspconfig" },
  { import = "custom.configs.extras.conform" },
  { import = "custom.configs.extras.copilot_chat" },
  -- { import = "custom.configs.extras.quarto-nvim" },
  { import = "custom.configs.extras.lint" },
  { import = "custom.configs.extras.statuscol" },
  { import = "custom.configs.extras.noice" },

  -- nvcommunity
  "NvChad/nvcommunity",
  { import = "nvcommunity.diagnostics.trouble" },
  { import = "nvcommunity.completion.copilot" },
  { import = "nvcommunity.editor.autosave" },
  { import = "nvcommunity.editor.telescope-undo" },
  { import = "nvcommunity.tools.telescope-fzf-native" },
  { import = "nvcommunity.editor.undo" },
  { "kevinhwang91/nvim-fundo", dependencies = "kevinhwang91/promise-async" },

  { "freitass/todo.txt-vim", lazy = false, event = "BufWinEnter Todo.txt" },

  {
    "folke/todo-comments.nvim",
    ft = { "python" },
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame = true,
    },
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },

  -- disabled
  { "williamboman/mason.nvim", enabled = false },
  { "NvChad/nvterm", enabled = false },
}

return plugins
