local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips"
g.loaded_python3_provider = nil
g.python3_host_prog = vim.fn.stdpath "config" .. "/lua/custom/.venv/bin/python3"

-- autocmds
autocmd("FileType", { pattern = "*", command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
autocmd("TextYankPost", { pattern = "*", command = "lua vim.highlight.on_yank{}" })
-- autocmd("CursorMoved", { pattern = "*", command = "lua vim.lsp.buf.clear_references()" })
-- autocmd("CursorHold", {
--   pattern = "*",
--   command = [[lua vim.diagnostic.open_float({border='single', focusable=false, show_header=false, scope='cursor'})]],
-- })
autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- options
opt.conceallevel = 2
opt.concealcursor = ""
opt.cmdheight = 0
opt.pumheight = 10
opt.linebreak = true
opt.cursorline = true
opt.signcolumn = "number"
opt.shortmess = "aoOstTWAIcqF"
opt.wildmode = "longest:full,full"
opt.complete = ".,w,b,u,t,i,kspell"

-- undo
opt.undofile = true
opt.history = 10000
opt.undodir = os.getenv "HOME" .. "/.local/share/nvim/undo"
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- folds
opt.numberwidth = 4
opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ", -- or "│" to use bar for show fold area
}
opt.foldcolumn = "1"
opt.foldnestmax = 1
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldtext = ""
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- spell
opt.spelllang = "en_gb"
