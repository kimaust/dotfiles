return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	cond = false,
	opts = {},
	config = function()
		require("ibl").setup()
	end,
}
