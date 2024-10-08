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

  -- extra plugins
  { "smoka7/hop.nvim", event = "VeryLazy", opts = {} },
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },
  { "kazhala/close-buffers.nvim", event = "VeryLazy", opts = {} },

  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup { silent_chdir = true, detection_methods = { "pattern" } }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle", "TodoTrouble" },
    dependencies = { { "folke/todo-comments.nvim", opts = {} } },
    opts = {},
  },

  { "dgagn/diagflow.nvim", event = "LspAttach", opts = {} },

  -- imports
  { import = "custom.configs.extras.cmp" },
  { import = "custom.configs.extras.yarepl" },
  { import = "custom.configs.extras.lspconfig" },
  { import = "custom.configs.extras.conform" },
  { import = "custom.configs.extras.lint" },
  { import = "custom.configs.extras.statuscol" },

  -- nvcommunity
  "NvChad/nvcommunity",
  { import = "nvcommunity.completion.codeium" },
  { import = "nvcommunity.editor.autosave" },
  { import = "nvcommunity.tools.telescope-fzf-native" },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      provider = "openai",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "HakonHarnes/img-clip.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

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

  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = {
      signcolumn = true,
      current_line_blame = true,
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "┆" },
        changedelete = { text = "┆" },
        untracked = { text = "┆" },
      },
      signs_staged_enable = false,
    },
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  {
    "toppair/peek.nvim",
    event = "VeryLazy",
    opts = {},
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
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
  { "JellyApple102/flote.nvim", event = "VeryLazy", opts = { window_border = "single" } },

  -- disabled
  { "nvim-tree/nvim-tree.lua", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
}

return plugins
