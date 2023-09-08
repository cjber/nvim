local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- autocmds
autocmd("FileType", { pattern = "*", command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" })
autocmd("TextYankPost", { pattern = "*", command = "lua vim.highlight.on_yank{}" })
autocmd("CursorHold", { pattern = "python", command = "lua vim.lsp.buf.document_highlight()" })
autocmd("CursorMoved", { pattern = "python", command = "lua vim.lsp.buf.clear_references()" })
autocmd("CursorHold", {
  pattern = "*",
  command = [[lua vim.diagnostic.open_float({border='single', focusable=false, show_header=false, scope='cursor'})]],
})

-- options
opt.cmdheight = 0
opt.linebreak = true

-- undo
opt.undofile = true
opt.history = 10000
opt.undodir = os.getenv "HOME" .. "/.local/share/nvim/undo"
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- folds
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- spell
opt.spelllang = "en_gb"
