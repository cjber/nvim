local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "yaml",
    "sql",
    "query",
    "jsonc",
  },
  indent = { enable = true },
  highlight = { enable = true },
}

M.telescope = {
  defaults = {
    -- layout_strategy = "center",
    -- layout_config = {
    --   preview_cutoff = 1,
    --   width = function(_, max_columns, _)
    --     return math.min(max_columns, 80)
    --   end,
    --
    --   height = function(_, _, max_lines)
    --     return math.min(max_lines, 15)
    --   end,
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- python
    "sourcery",
    "python-lsp-server",
    "ruff",
    "isort",
    "black",

    -- writing
    "ltex-ls",
    "grammarly-languageserver",

    -- bash
    "bash-language-server",
    "beautysh",

    -- json
    "fixjson",

    -- toml
    "taplo",

    -- sql
    "sqlls",
    "sqlfluff",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
