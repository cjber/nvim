---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>e"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>b"] = "",
    ["<leader>x"] = "",
    ["<leader>n"] = "",
    ["<leader>/"] = "",

    ["<leader>fm"] = "",
    ["<leader>cm"] = "",
    ["<leader>ch"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>ra"] = "",
    ["<leader>lD"] = "",
  },
}

M.general = {
  n = {
    ["q:"] = { "<CMD>q" },
    ["Q"] = { "<Nop>" },
    ["M"] = { "<CMD>join<CR>" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["J"] = { "}" },
    ["K"] = { "{" },
    ["H"] = { "^" },
    ["L"] = { "$" },
    ["U"] = { "<C-r>" },
    ["<C-h>"] = { "<C-w>h" },
    ["<C-j>"] = { "<C-w>j" },
    ["<C-k>"] = { "<C-w>k" },
    ["<C-l>"] = { "<C-w>l" },
    ["<Up>"] = { "<CMD>resize +2<CR>" },
    ["<Down>"] = { "<CMD>resize -2<CR>" },
    ["<C-space>"] = { "<CMD>bnext<CR>" },

    -- spell
    ["<leader>ss"] = { "<CMD>set invspell<CR>" },
    ["<leader>sf"] = { "ma[s1z=`a" },
  },

  v = {
    ["M"] = { "<CMD>join<CR>" },
    ["J"] = { "}" },
    ["K"] = { "{" },
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
  },

  t = { ["<ESC><ESC>"] = { "<C-\\><C-n>" } },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>lf"] = { "<CMD>lua vim.lsp.buf.format()<CR>", "format" },
    ["<leader>la"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "code action" },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>ld"] = { "<CMD>Telescope lsp_references<CR>", "LSP references" },
    ["<leader>lw"] = { "<CMD>Telescope lsp_document_symbols<CR>", "LSP symbols" },
    ["<leader>lc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

M.hop = {
  plugin = true,
  n = {
    ["s"] = { "<CMD>HopWord<CR>" },
    ["S"] = { "<CMD>HopLineStart<CR>" },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>le"] = { "<CMD>TroubleToggle<CR>" },
  },
}

return M
