-- Enable true (24-bit) color.
vim.opt.termguicolors = true

-- Use dark color theme if running in VSCode.
if vim.g.vscode then
	vim.opt.bg = "dark"
else
	vim.opt.bg = "light"
end
