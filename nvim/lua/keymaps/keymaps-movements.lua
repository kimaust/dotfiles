vim.keymap.set({ "n", "v" }, "<C-j>", "15j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-k>", "15k", { noremap = true, silent = true })
vim.keymap.set({ "i" }, "<C-j>", "<Esc>15ja", { noremap = true, silent = true })
vim.keymap.set({ "i" }, "<C-k>", "<Esc>15ka", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set({ "i" }, "<C-h>", "<Esc>^i", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set({ "i" }, "<C-l>", "<Esc>$a", { noremap = true, silent = true })
