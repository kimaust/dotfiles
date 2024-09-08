local opts = { remap = true, silent = true }

vim.keymap.set("n", "<C-/>", "gcc", opts)
vim.keymap.set("i", "<C-/>", "<ESC>gcci", opts)
vim.keymap.set("v", "<C-/>", "gc", opts)
