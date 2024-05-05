return {
    "dstein64/nvim-scrollview",
    config = function()
        local scrollview = require("scrollview")
        scrollview.setup({
            auto_mouse = false,
            hover = false,
            winblend = 0,
            mode = "simple",
            excluded_filetypes = { "nerdtree" },
            current_only = true,
            base = "right",
            signs_on_startup = {
                "conflicts",
                "cursor",
                "diagnostics",
                -- "loclist",
                -- "quickfix",
                "search",
                -- "spell",
                -- "textwidth",
                -- "trail",
            },
            signs_max_per_row = 3,
        })
    end,
}
