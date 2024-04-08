return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		-- Enable true color.
		vim.opt.termguicolors = true
		vim.opt.bg = "light"
	end,
	config = function()
		local specs = {
			dayfox = {
				syntax = {
					--keyword = "magenta",
					--conditionals = "magenta.bright",
					--number = "orange.dim",
					--operators = "orange",
				},
				git = {
					-- changed = ""
				},
			},
		}
		local groups = {
			dayfox = {
				--IncSearch = { bg = "palette.cyan" },
			},
		}
		require("nightfox").setup({
			options = {
				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false, -- Non focused panes set to alternative background
				module_default = true, -- Default enable value for modules
				styles = { -- Style to be applied to different syntax groups
					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "NONE",
					constants = "NONE",
					functions = "NONE",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
					variables = "NONE",
				},
				inverse = { -- Inverse highlight for different types
					match_paren = false,
					visual = false,
					search = false,
				},
				modules = { -- List of various plugins and additional options
				},
			},
			palettes = {},
			specs = specs,
			groups = groups,
		})
		-- Set up colorscheme. Must be after setup call.
		vim.cmd.colorscheme("dayfox")

		-- Set up lualine after colorscheme.
		require("lualine").setup({})
	end,
}
