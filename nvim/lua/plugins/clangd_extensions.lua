return {
	"p00f/clangd_extensions.nvim",
	config = function()
		vim.keymap.set("n", "<leader>ssh", "<Cmd>ClangdSwitchSourceHeader<CR>", {})
	end,
}
