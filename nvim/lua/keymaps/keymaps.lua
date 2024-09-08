local opts = { noremap = true, silent = true }

-- Convenience keymaps.
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR>", opts)
vim.keymap.set({ "i" }, "<C-x>", "<BS>", opts)
vim.keymap.set({ "n" }, "<C-x>", "xh", opts)

-- TODO: Figure out why this isn't working
-- vim.keymap.set({ "i" }, "<C-z>", "<Esc>ua",  opts)
vim.keymap.set({ "n", "v" }, "<C-z>", "u", opts)
vim.keymap.set({ "n", "v" }, "u", "<Nop>", opts)
vim.keymap.set({ "n", "v", "i", "t" }, "<C-t>", "<Nop>", opts)

-- inoremap <expr> <silent> <cr> pumvisible() ? "<c-y>" : "<c-g>u<cr>"
-- vim.keymap.set({ "i" }, "<C-r>", function()
--     vim.cmd("redo")
-- end, { noremap = true, silent = true })

-- FIXME: Doesn't work for some reason
-- vim.keymap.set("i", "<CR>", "<C-G>u<CR>", { noremap = true, silent = true })

-- vim.keymap.set({ "n", "v" }, "<CR>", "<Nop>", { noremap = true, silent = true })

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
