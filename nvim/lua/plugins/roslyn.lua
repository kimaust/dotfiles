return {
	"jmederosalvarado/roslyn.nvim",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("roslyn").setup({
			dotnet_cmd = "dotnet", -- this is the default
			roslyn_version = "4.8.0-3.23475.7", -- this is the default
			on_attach = function() end, -- required
			capabilities = capabilities, -- required
		})
	end,
}
