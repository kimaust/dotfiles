-- Tab keymaps.
vim.keymap.set("n", "<Leader>1", "1gt", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>2", "2gt", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>3", "3gt", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>4", "4gt", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>5", "5gt", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "gt", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "gT", { noremap = true, silent = true })

-- Convenience keymaps.
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "i", "v" }, "<C-z>", "u", { noremap = true, silent = true })
vim.keymap.set("n", "u", "<Nop>", { noremap = true, silent = true })

-- vim.keymap.set("n", "<Leader>q", "<Cmd>q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>E", "<Cmd>Ex<CR>", { noremap = true, silent = true })

-- Scrolling
--
-- Map <C-d> and <C-u> to do cursor-only movement as that gives more natural
-- behaviour.
-- vim.keymap.set({ "n", "i", "v" }, "<C-d>", function()
-- 	local half_screen_height = math.floor(vim.api.nvim_win_get_height(0) / 2)
-- 	return half_screen_height .. "j"
-- end, { expr = true })
--
-- vim.keymap.set({ "n", "i", "v" }, "<C-u>", function()
-- 	local half_screen_height = math.floor(vim.api.nvim_win_get_height(0) / 2)
-- 	return half_screen_height .. "k"
-- end, { expr = true })
