return {
    "ray-x/lsp_signature.nvim",
    config = function()
        local lsp_signature = require("lsp_signature")
        lsp_signature.setup({
            wrap = true,
            max_height = 100,
            max_width = 100,
            handler_opts = {
                border = "rounded",
            },
            hint_enable = true,
            hint_prefix = " ",
            hint_inline = function()
                return false
            end,
            toggle_key = "<M-x>",
        })
    end,
}
