return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
			},
			-- Set up format on save
			format_on_save = {
				async = false,
				timeout_ms = 500,
				lsp_fallback = false,
			},
			-- Turn off notify on error to allow saving files with errors.
			notify_on_error = false,
		})
		vim.keymap.set({ "n", "v" }, "<leader>rf", function()
			conform.format({
				async = false,
				timeout_ms = 500,
				lsp_fallback = false,
			})
		end, { desc = "Format file or range in visual mode." })
	end,
}
