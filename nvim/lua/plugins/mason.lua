return {
	"williamboman/mason.nvim",
	lazy = false,
	config = function()
		local mason = require("mason")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			pip = {
				-- Whether to upgrade pip to the latest version in the virtual
				-- environment before installing packages.
				upgrade_pip = true,
			},
		})
	end,
}
