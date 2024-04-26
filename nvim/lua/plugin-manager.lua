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
        import = "plugins.fzf",
    },
    {
        import = "plugins.telescope",
    },
    {
        import = "plugins.lsp",
    },
    {
        import = "plugins.ui",
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
    require("plugins.indent-blankline"),
    "folke/which-key.nvim",
    { "folke/neoconf.nvim" },
    -- require("plugins.nvim-dap"),
    --"RRethy/vim-illuminate",
})

lazy.stats({
    -- when true, startuptime is the accurate cputime for the Neovim process.
    -- (Linux & Macos)
    -- this is more accurate than `nvim --startuptime`, and as such will be slightly higher
    -- when false, startuptime is calculated based on a delta with a timestamp when lazy started.
    real_cputime = true,
})
