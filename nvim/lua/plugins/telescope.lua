return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				--preview = false,
				layout_strategy = "vertical",
				sorting_strategy = "ascending",
				layout_config = {
					vertical = {
						prompt_position = "top",
						mirror = true,
					},
				},
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<C-c>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					-- ivy, dropdown, cursor
					-- NOTE: Overrides the global layout_strategy
					--theme = "dropdown",
				},
			},
		})
		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		-- vim.keymap.set("n", "<leader>fe", builtin.file_browser, {})
		vim.keymap.set("n", "<leader>fgf", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
		vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>gsh", builtin.git_stash, {})
	end,
}
