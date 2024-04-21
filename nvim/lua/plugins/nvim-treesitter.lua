return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Prefer git to workaround issues with certificates.
		local treesitter_install = require("nvim-treesitter.install")
		treesitter_install.prefer_git = true
		-- Workaround the issue with msys2.
		treesitter_install.compilers = { "clang" }

		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = {
				"bash",
				"c",
				"c_sharp",
				"cmake",
				"cpp",
				"css",
				"csv",
				"cuda",
				"disassembly",
				"git_config",
				"gitattributes",
				"gitignore",
				"glsl",
				"go",
				"hlsl",
				"html",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
                "pug",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"query",
				"xml",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
					node_incremental = "<Leader>si",
					scope_incremental = "<Leader>sc",
					node_decremental = "<Leader>sd",
				},
			},
		})
	end,
}
