local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- base overrides
  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next = { ["<A-j>"] = "@function.outer" },
            goto_previous = {
              ["<A-k>"] = "@function.outer",
            },
          },
        },
      }
    end,
  },
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
  -- { import = "custom.configs.extras.noice" },

  -- nvcommunity
  "NvChad/nvcommunity",
  { import = "nvcommunity.diagnostics.trouble" },
  { import = "nvcommunity.completion.copilot" },
  { import = "nvcommunity.editor.autosave" },
  -- { import = "nvcommunity.editor.telescope-undo" },
  -- { import = "nvcommunity.tools.telescope-fzf-native" },
  -- { import = "nvcommunity.editor.undo" },
  -- { "kevinhwang91/nvim-fundo", dependencies = "kevinhwang91/promise-async" },

  { "freitass/todo.txt-vim", lazy = false },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      columns = { "icon", "permissions", "size", "mtime" },
      delete_to_trash = true,
      keymaps_help = { border = "single" },
      view_options = { show_hidden = true },
    },
  },

  -- {
  --   "folke/todo-comments.nvim",
  --   ft = { "python" },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },

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
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.notify = require "notify"
      require("notify").setup {
        stages = "fade",
        render = "wrapped-compact",
        timeout = 200,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { border = "single" })
        end,
      }
    end,
  },

  -- disabled
  { "williamboman/mason.nvim", enabled = false },
  { "NvChad/nvterm", enabled = false },
}

return plugins
