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
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
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
