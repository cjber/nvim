---@type MappingsTable
local M = {}

M.general = {
  n = {
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

  },

  v = {
    ["M"] = { ":join<CR>" },
    ["J"] = { "}" },
    ["K"] = { "{" },
    ["<"] = { "<gv" },
    [">"] = { ">gv" },

  },

  t = { ["<ESC><ESC>"] = { "<C-\\><C-n>" } },
}
return M
