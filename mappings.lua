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
    ["<leader>f"] = "",
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
    ["q:"] = { "<CMD>q<CR>" },
    ["Q"] = { "<Nop>" },
    ["M"] = { "<CMD>join<CR>" },
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
    -- ["<C-space>"] = { "<CMD>bnext<CR>" },
    ["<C-n>"] = { "<CMD>Oil<CR>" },

    -- spell
    ["<leader>ss"] = { "<CMD>set invspell<CR>" },
    ["<leader>sf"] = { "ma[s1z=`a" },

    -- buffers
    ["<leader>bo"] = {
      [[<CMD>lua require("close_buffers").delete({type="other"})<CR><CMD>silent on<CR>]],
      "close other",
    },
    ["<leader>bd"] = { [[<CMD>lua require("close_buffers").delete({type="this"})<CR>]], "close buffer" },

    -- update
    ["<leader>u"] = { "<CMD>NvChadUpdate<CR>", "update" },

    -- hop
    ["s"] = { "<CMD>HopWord<CR>" },
    ["S"] = { "<CMD>HopLineStart<CR>" },

    -- flote
    ["<leader>fm"] = { "<CMD>Flote<CR>", "open project notes" },

    -- time tracker
    ["<leader>tt"] = { "<CMD>TimeTracker<CR>", "time tracker" },
  },

  v = {
    ["M"] = { "J" },
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
    -- ["<M-k>"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "hover" },
    ["<leader>le"] = { "<CMD>Trouble diagnostics toggle<CR>" },
    ["<leader>lf"] = { "<CMD>lua require'conform'.format()<CR>", "format" },
    ["<leader>la"] = { "<CMD>lua vim.lsp.buf.code_action()<CR>", "code action" },
    ["<leader>lk"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "code hover" },
    ["<leader>lg"] = { "<CMD>lua require'neogen'.generate()<CR>", "generate doc" },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>ll"] = { "<CMD>Trouble lsp_document_symbols toggle<CR>", "LSP symbols" },
    ["<leader>ld"] = { "<CMD>Trouble lsp_references toggle<CR>", "LSP references" },
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

return M
