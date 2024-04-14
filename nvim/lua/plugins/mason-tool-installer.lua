return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
				"luacheck",
				"bash-language-server",
				"lua-language-server",
				"vim-language-server",
				"shellcheck",
				-- "misspell",
				"editorconfig-checker",
			},
			auto_update = false,
			run_on_start = true,
		})
	end,
}
