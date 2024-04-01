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

require("lazy").setup({
	require("plugins.nightfox"),
	require("plugins.mason"),
	require("plugins.mason-lspconfig"),
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")

			mason_tool_installer.setup({
				ensure_installed = {
					"prettierd",
					"eslint_d",
					"stylua",
					"luacheck",
					"bash-language-server",
					"lua-language-server",
					"vim-language-server",
					"shellcheck",
					"misspell",
					"editorconfig-checker",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
	require("plugins.conform"),
	require("plugins.nvim-treesitter"),
	require("plugins.nvim-treesitter-textobjects"),
	require("plugins.telescope"),
	require("plugins.telescope-fzf-native"),
	require("plugins.dressing"),
	require("plugins.nvim-lspconfig"),
	require("plugins.nvim-lint"),
	require("plugins.nvim-cmp"),
	require("plugins.comment"),
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",

						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
			})
		end,
	},
	--require("plugins.indent-blankline"),
	{ "folke/neodev.nvim", opts = {} },
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
})

-- Custom lua scripts
require("plugins.last-place-cursor")
