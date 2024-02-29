local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "dgagn/diagflow.nvim",
        event = "LspAttach",
        opts = {},
      },
      {
        "stevearc/conform.nvim",
        opts = {},
        event = { "BufNewFile", "BufWritePre" },
        lazy = true,
        config = function()
          require("conform").setup {
            formatters_by_ft = {
              python = { "ruff_format", "ruffer" },
              lua = { "stylua" },
            },
            format_on_save = {
              lsp_fallback = true,
              timeout_ms = 500,
            },
            formatters = {
              ruffer = {
                command = "ruff",
                args = {
                  "--fix",
                  "-e",
                  "--target-version",
                  "py312",
                  "--unfixable",
                  "F401,F841",
                  "--extend-select",
                  "ARG,B,C4,DTZ,I,S,UP",
                  "--stdin-filename",
                  "$FILENAME",
                  "-",
                },
                stdin = true,
                cwd = require("conform.util").root_file {
                  "pyproject.toml",
                  "ruff.toml",
                },
              },
            },
          }
        end,
      },
      {
        "mfussenegger/nvim-lint",
        config = function()
          require("lint").linters_by_ft = {
            python = { "mypy" },
            lua = { "luacheck" },
            sh = { "shellcheck" },
            markdown = { "vale" },
            quarto = { "vale" },
            vim = { "vint" },
            yaml = { "yamllint" },
            json = { "jsonlint" },
            dockerfile = { "hadolint" },
          }
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("core.utils").load_mappings "lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
    opts = function()
      local opts = require "plugins.configs.cmp"
      local cmp = require "cmp"

      opts.completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      }

      opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }

      return opts
    end,
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
  { import = "custom.configs.extras.yarepl" },

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

  -- { "kevinhwang91/nvim-hlslens", opts = {} },

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
  {
    "folke/todo-comments.nvim",
    ft = { "python" },
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  -- { "Dronakurl/injectme.nvim", lazy = false },

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
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    opts = {
      show_help = "yes",
      debug = false,
      disable_extra_info = "no",
      language = "English",
    },
    build = function()
      vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccb", "<cmd>CopilotChatBuffer<cr>", desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit",
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },
  { "nvim-focus/focus.nvim", lazy = false, opts = { autoresize = { minheight = 15, height = 85 } } },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
      cmdline = { enabled = true, view = "cmdline_popup" },
      messages = { enabled = true, view = "mini", view_error = "mini", view_warn = "mini" },
      redirect = { enabled = true, view = "mini" },
      notify = { enabled = true, view = "mini" },
      errors = { enabled = true, view = "mini" },
      last = { enabled = true, view = "mini" },
      lsp = {
        message = { view = "mini" },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          silent = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        cmdline_popup = {
          border = { padding = { 0, 1 }, style = "single" },
          win_options = {
            winhighlight = { FloatBorder = "FloatBorder", FloatTitle = "FloatBorder" },
          },
          position = { row = "30%", col = "50%" },
        },
        cmdline_popupmenu = {
          border = "single",
          win_options = { winhighlight = { FloatBorder = "FloatBorder" } },
          position = { row = "50%", col = "50%" },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- disabled
  { "williamboman/mason.nvim", enabled = false },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
}

return plugins
