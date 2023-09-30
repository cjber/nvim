local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snips"
g.loaded_python3_provider = nil
g.python3_host_prog = vim.fn.stdpath "config" .. "/.direnv/python-3.11/bin/python3"

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
opt.pumheight = 10
opt.linebreak = true
opt.cursorline = true
opt.signcolumn = "number"
opt.shortmess = "aoOstTWAIcqFS"
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect"
opt.complete = ".,w,b,u,t,i,kspell"

-- undo
opt.undofile = true
opt.history = 10000
opt.undodir = os.getenv "HOME" .. "/.local/share/nvim/undo"
opt.swapfile = false
opt.undofile = true
opt.writebackup = false

-- folds
opt.foldcolumn = "0"
opt.foldnestmax = 1
opt.foldlevel = 99
opt.foldlevelstart = 99

-- spell
opt.spelllang = "en_gb"
