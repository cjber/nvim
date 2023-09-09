-- keymaps
vim.api.nvim_set_keymap(
  "n",
  "<Leader>kk",
  ":term quarto render %:p --execute-dir $PWD<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<Leader>kp", ":silent! !zathura %:r.pdf &<CR>", { noremap = true, silent = true })
