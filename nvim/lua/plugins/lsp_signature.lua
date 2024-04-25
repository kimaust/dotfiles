return {
    "ray-x/lsp_signature.nvim",
    config = function()
        local lsp_signature = require("lsp_signature")
        lsp_signature.setup({
            handler_opts = {
                border = "rounded",
            },
        })
        vim.keymap.set({ "n", "i" }, "<M-S-h>", function()
            lsp_signature.toggle_float_win()
        end, { silent = true, noremap = true, desc = "toggle signature" })
    end,
}
