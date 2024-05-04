return {
    "windwp/nvim-ts-autotag",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            autotag = {
                enable = true,
            },
        })
    end,
}
