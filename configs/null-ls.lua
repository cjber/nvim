local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- Lua
  b.formatting.stylua,

  -- python
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.isort.with { extra_args = { "--float-to-top", "-m=3" } },

  -- bash
  b.formatting.beautysh,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
