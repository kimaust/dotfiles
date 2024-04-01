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
		"stevearc/conform.nvim",
		opts = {},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					html = { "prettierd" },
					css = { "prettierd" },
					json = { "prettierd" },
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
				},
				-- Set up format on save
				format_on_save = {
					async = false,
					timeout_ms = 500,
					lsp_fallback = false,
				},
				notify_on_error = true,
			})
			--{ desc = "Format file or range in visual mode." }
			vim.keymap.set({ "n", "v" }, "<leader>rf", function()
				conform.format({
					async = false,
					timeout_ms = 500,
					lsp_fallback = false,
				})
			end)
		end,
	},
	--{ "folke/neodev.nvim", opts = {} },
	require("plugins.nvim-treesitter"),
	require("plugins.nvim-treesitter-textobjects"),
	require("plugins.telescope"),
	require("plugins.telescope-fzf-native"),
	require("plugins.dressing"),
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setup language servers.
			local lspconfig = require("lspconfig")

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
	require("plugins.comment"),
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
})

-- Custom lua scripts
require("plugins.last-place-cursor")
