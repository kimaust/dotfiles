return {
    "dstein64/nvim-scrollview",
    config = function()
        local scrollview = require("scrollview")
        scrollview.setup({
            excluded_filetypes = { "nerdtree" },
            current_only = true,
            base = "right",
            signs_on_startup = {
                "conflicts",
                "cursor",
                "diagnostics",
                "loclist",
                "quickfix",
                "search",
                "spell",
                "textwidth",
                "trail",
            },
        })
    end,
}
