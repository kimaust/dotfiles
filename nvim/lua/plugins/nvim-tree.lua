return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvim_tree = require("nvim-tree")
		nvim_tree.setup({
			view = {
				side = "right",
			},
		})
	end,
}
