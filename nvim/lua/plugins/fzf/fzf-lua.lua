return {
	"ibhagwan/fzf-lua",
	-- Disabled since it doesn't work on msys2 for now.
	enabled = false,
	-- Optional dependency for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- config = function()
	-- 	-- Calling `setup` is optional for customization.
	-- 	require("fzf-lua").setup({})
	-- 	vim.keymap.set({"n", "i"}, "<C-p>", "<cmd>FzfLua files<CR>")
	-- end,
}
