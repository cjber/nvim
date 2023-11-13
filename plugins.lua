local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("core.utils").load_mappings "lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "jc-doyle/cmp-pandoc-references" },
    opts = overrides.cmp,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "smoka7/hop.nvim",
    lazy = false,
    config = function(_, opts)
      require("core.utils").load_mappings "hop"
      require("hop").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require("project_nvim").setup { sinlent_chdir = true, detection_methods = { "pattern" } }
    end,
  },

  -- imports
  -- { import = "custom.configs.extras.ufo" },
  { import = "custom.configs.extras.yarepl" },
  -- { import = "custom.configs.extras.quarto-nvim" },

  -- nvcommunity
  "NvChad/nvcommunity",
  { import = "nvcommunity.diagnostics.trouble" },
  { import = "nvcommunity.completion.copilot" },
  { import = "nvcommunity.editor.treesittercontext" },
  { import = "nvcommunity.editor.autosave" },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    config = function(_, _)
      require("trouble").setup()
      require("core.utils").load_mappings "trouble"
    end,
  },

  {
    "kevinhwang91/nvim-fundo",
    lazy = false,
    config = function()
      require("fundo").install()
    end,
  },

  { "kevinhwang91/nvim-hlslens", opts = {} },

  {
    "jiaoshijie/undotree",
    lazy = false,
    config = function()
      require("undotree").setup {}
      require("core.utils").load_mappings "undo"
    end,
  },

  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

  { "kazhala/close-buffers.nvim", event = "VeryLazy", opts = {} },

  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install .",
    enabled = vim.fn.isdirectory(vim.fn.expand "~/.config/nvim/.venv"),
    event = "BufWinEnter *.ju.py",
    config = function()
      local jupynium = require "jupynium"
      jupynium.setup {
        use_default_keybindings = false,
        auto_start_server = { enable = true },
        -- auto_start_sync = { enable = true },
      }
      require("core.utils").load_mappings "jupynium"
    end,
  },

  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      local builtin = require "statuscol.builtin"

      require("statuscol").setup {
        relculright = true,
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        },
      }
    end,
  },

  { "freitass/todo.txt-vim", lazy = false, event = "BufWinEnter Todo.txt" },

  -- disabled
  { "lewis6991/gitsigns.nvim", enabled = false },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
