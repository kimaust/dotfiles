return {
    "Jezda1337/nvim-html-css",
    -- Requires git directory
    enabled = false,
    dependencies = {
        { "nvim-treesitter/nvim-treesitter", lazy = false },
        { "nvim-lua/plenary.nvim", lazy = false },
    },
    config = function()
        require("html-css").setup({})
    end,
}
