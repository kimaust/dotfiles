local opts = { noremap = true, silent = true }

-- Don't leave insert mode.
vim.keymap.set({ "n", "v", "i" }, "<C-h>", function()
    vim.cmd("norm! h")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-j>", function()
    vim.cmd("norm! j")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-k>", function()
    vim.cmd("norm! k")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-l>", function()
    vim.cmd("norm! l")
end, opts)

-- For faster movements.
vim.keymap.set({ "n", "v", "i" }, "<C-S-h>", function()
    vim.cmd("norm! 15h")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-S-j>", function()
    vim.cmd("norm! 15j")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-S-k>", function()
    vim.cmd("norm! 15k")
end, opts)
vim.keymap.set({ "n", "v", "i" }, "<C-S-l>", function()
    vim.cmd("norm! 15l")
end, opts)
