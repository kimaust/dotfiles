return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				-- Automatically refresh the panel when the file changes.
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				-- Suggest after entering insert mode.
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<S-CR>",
					accept_word = "<S-Tab>",
					accept_line = "<S-Down>",
					next = "<S-Right>",
					prev = "<S-Left>",
					dismiss = false,
				},
			},
			server_opts_overrides = {
				trace = "verbose",
				settings = {
					advanced = {
						--length = 500,
						listCount = 5,
						inlineSuggestCount = 3,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>op", "<cmd>Copilot panel<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>ct", "<cmd>Copilot toggle<CR>", { noremap = true, silent = true })
	end,
}
