return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local copilot = {
			"copilot",
			symbols = {
				status = {
					icons = {
						enabled = "",
						sleep = "", -- auto-trigger disabled
						disabled = "",
						warning = "",
						unknown = "",
					},
					hl = {
						enabled = "#50FA7B",
						sleep = "#AEB7D0",
						disabled = "#6272A4",
						warning = "#FFB86C",
						unknown = "#FF5555",
					},
				},
				spinners = require("copilot-lualine.spinners").dots,
				spinner_color = "#6272A4",
			},
			show_colors = false,
			show_loading = true,
		}

		local lualine = require("lualine")
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "branch", "diff" },
				lualine_b = { "buffers" },
				lualine_x = {
					"%S",
					"diagnostics",
					copilot,
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
