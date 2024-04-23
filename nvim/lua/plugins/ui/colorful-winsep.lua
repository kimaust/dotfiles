return {
    "nvim-zh/colorful-winsep.nvim",
    commit = "e1b72c4",
    config = function()
        require("colorful-winsep").setup({
            smooth = false,
            anchor = {
                left = { height = 1, x = -1, y = -1 },
                right = { height = 1, x = -1, y = 0 },
                up = { width = 0, x = -1, y = 0 },
                bottom = { width = 0, x = 1, y = 0 },
            },
        })
    end,
}
