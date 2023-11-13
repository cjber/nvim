local none_ls = require "null-ls"

local b = none_ls.builtins

local sources = {

  -- Lua
  b.formatting.stylua,

  -- python
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.isort.with { extra_args = { "--float-to-top", "-m=3" } },

  -- bash
  b.formatting.beautysh,

  -- sql
  -- b.diagnostics.sqlfluff.with {
  --   extra_args = { "--dialect", "duckdb" }, -- change to your dialect
  -- },
}

none_ls.setup {
  debug = true,
  sources = sources,
}
