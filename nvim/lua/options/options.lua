-- Disable timeout
vim.opt.timeout = false
vim.opt.ttimeout = false

--Fix for Windows

-- Turn on line numbering and relative numbering.
vim.opt.number = true
vim.opt.relativenumber = true
-- Always draw sign to avoid resizing when in normal mode.
vim.opt.signcolumn = "yes"

-- Split new window to below and right instead of top and left.
vim.opt.splitbelow = true
vim.opt.splitright = true

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
vim.opt.colorcolumn = "80,100"

-- Show incomplete commands in the status bar.
vim.opt.showcmd = true
-- Show partial command in the status line when typing them.
vim.opt.showcmdloc = "statusline"

-- Show a menu in the status bar when using tab completion.
vim.opt.wildmenu = true

-- Keep large history
vim.opt.history = 1000

-- Wrap around break instead of mid-word
-- vim.opt.lbr = true

-- Wrap around 100 characters.
-- vim.opt.textwidth = 100
-- Turn off list mode.
--vim.opt.list = false

-- Make buffers hidden instead of unloading
vim.opt.hidden = true

-- Show the current cursor line.
vim.opt.cursorline = true
