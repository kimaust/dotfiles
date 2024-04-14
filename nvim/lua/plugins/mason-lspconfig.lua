return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	config = function()
		local configs = require("mason-lspconfig")

		configs.setup({
			ensure_installed = {
				--"asm_lsp",
				"lua_ls",
				"jsonls",
				"clangd",
				-- "omnisharp",
				-- "rust_analyzer",
				"vimls",
				"bashls",
				"awk_ls",
				"html",
				"cssls",
				"tsserver",
				"tailwindcss",
			},
			automatic_installation = true,
		})
		configs.setup_handlers({
			function(server_name)
				local lspconfig = require("lspconfig")
				lspconfig[server_name].setup({})
			end,
			-- ["lua_ls"] = function()
			-- 	local lspconfig = require("lspconfig")
			-- 	lspconfig.lua_ls.setup({
			-- 		settings = {
			-- 			Lua = {
			-- 				diagnostics = {
			-- 					globals = { "vim" },
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,
		})
	end,
}
