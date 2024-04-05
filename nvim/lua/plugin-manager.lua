local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
	{
		import = "plugins",
	},
	{
		import = "plugins.local",
	},
}, {
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enable = false,
		notify = false,
	},
}, {
	-- require("plugins.nightfox"),
	-- require("plugins.mason"),
	-- require("plugins.mason-lspconfig"),
	-- require("plugins.mason-tool-installer"),
	-- require("plugins.conform"),
	-- require("plugins.nvim-treesitter"),
	-- require("plugins.nvim-treesitter-textobjects"),
	-- require("plugins.telescope"),
	-- require("plugins.telescope-fzf-native"),
	-- require("plugins.dressing"),
	-- require("plugins.nvim-lspconfig"),
	-- require("plugins.nvim-lint"),
	-- require("plugins.nvim-cmp"),
	-- require("plugins.comment"),
	-- require("plugins.copilot"),
	-- require("plugins.nvim-tree"),
	require("plugins.indent-blankline"),
	-- require("plugins.nvim-dap"),
	--    require("plugins.lualine"),
	--"airblade/vim-gitgutter",
	--"RRethy/vim-illuminate",
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
})

lazy.stats({
	-- when true, startuptime is the accurate cputime for the Neovim process.
	-- (Linux & Macos)
	-- this is more accurate than `nvim --startuptime`, and as such will be slightly higher
	-- when false, startuptime is calculated based on a delta with a timestamp when lazy started.
	real_cputime = true,
})
