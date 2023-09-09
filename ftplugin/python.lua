-- keymaps
vim.api.nvim_set_keymap("n", "<CR>", ":REPLSendLine<CR>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>al", ":REPLStart ipython<CR>:wincmd p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>a;", ":REPLToCurLine<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ad", ":REPLHideOrFocus<CR>:wincmd p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<CR>", ":REPLSendVisual<CR>", { noremap = true, silent = true })
