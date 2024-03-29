vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy.lazy")

-- Custom Vim options
-- Turn on line numbering and relative numbering.
vim.opt.number = true
vim.opt.relativenumber = true

-- Split new window to below and right instead of top and left.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Expand tab to space, tab to take 4 space and indentation to 4 spaces.
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Copies indentation from current line when starting a new line
vim.opt.autoindent = true
-- Smart auto-indenting when starting a new line
vim.opt.smartindent = true

-- Keep the cursor in the center when scrolling
vim.opt.scrolloff = 999

-- Enable cursor go past area with no characters for block mode.
-- Useful for visual block mode.
vim.opt.virtualedit = "block"

-- Have a separate window for matches.
vim.opt.inccommand = "split"

-- Ignore case when searching. Note that neovim commands are in lowercase 
-- whereas custom plugins are always capital.
vim.opt.ignorecase = true
-- Override the ignore case option if the pattern contains uppercase letters.
vim.opt.smartcase = true

-- Make cursor blink
--vim.opt.guicursor = "a:blinkon50-blinkoff50-blinkwait1"
--vim.opt.guicursor="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- vim.opt.clipboard = "unnamedplus"

-- Turn on incremental search, i.e. search preview
vim.opt.is = true

-- Turn on highlight search, keep searched term highlighted.
vim.opt.hls = true

-- Show cursor position all the time
vim.opt.ruler = true

-- Show incomplete commands in the status bar.
vim.opt.showcmd = true

-- Show a menu in the status bar when using tab completion.
vim.opt.wildmenu = true

-- Keep large history
vim.opt.history = 1000
-- Create backup, will create another file with ~suffix default.
-- vim.opt.backup = true
-- Set backup extension.
-- vim.opt.bex = extension

-- Wrap around break instead of mid-word
vim.opt.lbr = true

-- Make buffers hidden instead of unloading
vim.opt.hidden = true

vim.opt.cursorline = true

-- Re-center after scroll
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})

-- Set color scheme (~/.vim/colors)
--color name

-- map KEY KEYSTROEKS

-- Using leader key (default \), leader key must be above mapping.
--let mapleader=","
--map <leader><key> <command>

