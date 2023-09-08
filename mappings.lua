---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["q:"] = { ":q" },
    ["Q"] = { "<Nop>" },
    ["M"] = { ":join<CR>" },
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
    ["<Up>"] = { ":resize +2<CR>" },
    ["<Down>"] = { ":resize -2<CR>" },
    ["<C-space>"] = { ":bnext<CR>" },

    -- spell
    ["<Space>sf"] = { "ma[s1z=`a" },

    -- lsp
    ["<Space>le"] = { ":TroubleToggle<CR>" },

    -- hop
    ["s"] = { ":HopWord<CR>" },
    ["S"] = { ":HopLineStart<CR>" },

    -- yarepl
    ["<CR>"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd ":REPLSendLine"
          vim.cmd ":norm j"
        end
      end,
    },
    ["<leader>c;"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd ":REPLToCurLine"
        end
      end,
    },
    ["<leader>cl"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd ":REPLStart ipython"
          vim.cmd ":wincmd p"
        end
      end,
    },
    ["<leader>cd"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd ":REPLHideOrFocus"
          vim.cmd ":wincmd p"
        end
      end,
    },
  },

  v = {
    ["M"] = { ":join<CR>" },
    ["J"] = { "}" },
    ["K"] = { "{" },
    ["<"] = { "<gv" },
    [">"] = { ">gv" },

    -- yarepl
    ["<CR>"] = {
      function()
        if vim.bo.filetype == "python" then
          vim.cmd ":REPLSendVisual"
        end
      end,
    },
  },

  t = { ["<ESC><ESC>"] = { "<C-\\><C-n>" } },
}
return M
