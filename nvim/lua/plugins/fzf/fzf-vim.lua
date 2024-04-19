return {
	"junegunn/fzf.vim",
	config = function()
		vim.keymap.set({ "n", "i" }, "<C-p>", "<Cmd>Files<CR>")
	end,
}
