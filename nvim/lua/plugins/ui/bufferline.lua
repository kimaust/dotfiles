return {
    "akinsho/bufferline.nvim",
    -- Till bufferline is fixed with noice.
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
    config = function()
        require("bufferline").setup({})
    end,
}
