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
    ["q:"] = { "<CMD>q" },
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
    ["<C-space>"] = { "<CMD>bnext<CR>" },

    --hlslens
    ["n"] = { [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
    ["N"] = {
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    },
    ["*"] = { [[*<Cmd>lua require('hlslens').start()<CR>]] },
    ["#"] = { [[#<Cmd>lua require('hlslens').start()<CR>]] },

    -- spell
    ["<leader>ss"] = { "<CMD>set invspell<CR>" },
    ["<leader>sf"] = { "ma[s1z=`a" },

    -- buffers
    ["<leader>bo"] = {
      [[<CMD>lua require("close_buffers").delete({type="other"})<CR><CMD>silent on<CR>]],
      "close other",
    },
    ["<leader>bd"] = { [[<CMD>lua require("close_buffers").delete({type="this"})<CR>]], "close buffer" },
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
    ["<M-k>"] = { "<CMD>lua vim.lsp.buf.hover()<CR>", "hover" },
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

M.undo = {
  plugin = true,
  n = {
    ["<leader>fu"] = { [[<CMD>lua require("undotree").toggle()<CR>]] },
  },
}

M.jupynium = {
  plugin = true,
  n = {
    ["<leader>x"] = { [[<CMD>JupyniumExecuteSelectedCells<CR>]] },
    ["<leader>s"] = { [[<CMD>JupyniumStartAndAttachToServerInTerminal<CR>]] },
    ["<leader>d"] = {
      function()
        local filename_wo_ext = vim.fn.expand "%:r:r"
        vim.cmd([[JupyniumStartSync ]] .. filename_wo_ext)
      end,
    },
    ["<leader>c"] = { [[<CMD>JupyniumStopSync<CR>]] },
    ["<leader>m"] = { [[<CMD>JupyniumShortsightedToggle<CR>]] },
  },
}

M.ufo = {
  plugin = true,
  n = {
    ["zR"] = { [[<CMD>lua require("ufo").openAllFolds()<CR>]] },
    ["zM"] = { [[<CMD>lua require("ufo").closeAllFolds()<CR>]] },
  },
}

return M
