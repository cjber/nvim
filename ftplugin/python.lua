-- keymaps
vim.api.nvim_set_keymap("n", "<CR>", "<CMD>REPLSendLine<CR>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>al", "<CMD>REPLStart ipython<CR>:wincmd p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>a;", "<CMD>REPLToCurLine<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>ad", "<CMD>REPLHideOrFocus<CR>:wincmd p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<CR>", "<CMD>REPLSendVisual<CR>", { noremap = true, silent = true })
