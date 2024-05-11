return {
    "akinsho/bufferline.nvim",
    -- Till bufferline is fixed with noice.
    -- version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                mode = "buffers",
                numbers = "none",
                show_close_icon = false,
                show_buffer_close_icons = false,
                hover = {
                    enabled = false,
                },
                tab_size = 18,
                max_name_length = 18,
                show_buffer_icons = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
            },
        })
    end,
}
