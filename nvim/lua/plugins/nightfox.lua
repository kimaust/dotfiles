return { 
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        -- Enable true color, set background to light and theme to dayfox.
        vim.opt.termguicolors = true
        vim.opt.bg = "light"
        vim.cmd.colorscheme("dayfox")
    end
}
 
