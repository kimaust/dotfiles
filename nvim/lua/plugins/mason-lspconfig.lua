return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		local configs = require("mason-lspconfig")

		configs.setup({
			ensure_installed = {
				--"asm_lsp",
				"lua_ls",
				"clangd",
				"omnisharp",
				--"rust_analyzer",
				"vimls",
				"bashls",
				"awk_ls",
				"html",
				"cssls",
				"tsserver",
				"tailwindcss",
				--"eslint_d",
				-- "prettierd",
				--"clang-format",
			},
			automatic_installation = true,
		})
		configs.setup_handlers({
			function(server_name)
				local lspconfig = require("lspconfig")
				lspconfig[server_name].setup({})
			end,
		})
	end,
}
