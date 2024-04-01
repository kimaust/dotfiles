return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Completion source for neovim's built-in language server client.
		"hrsh7th/cmp-nvim-lsp",
		-- Completion source for recommending text within the buffer.
		"hrsh7th/cmp-buffer",
		-- Completion source for file system path
		"hrsh7th/cmp-path",
		-- Snippet engine
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			-- Replace <CurrentMajor> by the latest released major (first number of latest release)
			version = "v2.*",
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		-- Completion source for the lua snippet engine
		"saadparwaiz1/cmp_luasnip",
		-- Completion source for command line
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
