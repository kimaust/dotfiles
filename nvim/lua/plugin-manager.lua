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
    { import = "plugins" },
    { import = "plugins.colortheme" },
    { import = "plugins.completion" },
    { import = "plugins.copilot" },
    { import = "plugins.dap" },
    { import = "plugins.formatter" },
    { import = "plugins.fzf" },
    { import = "plugins.lint" },
    { import = "plugins.lsp" },
    { import = "plugins.scroll" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
    { import = "plugins.ui" },
    { import = "plugins.local" },
}, {
    change_detection = {
        -- Automatically check for config file changes and reload the ui.
        enable = false,
        notify = false,
    },
})
