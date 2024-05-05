return {
    "ray-x/lsp_signature.nvim",
    config = function()
        local lsp_signature = require("lsp_signature")
        lsp_signature.setup({
            wrap = true,
            max_height = 100,
            max_width = 100,
            bind = true,
            handler_opts = {
                border = "rounded",
            },
            hint_enable = true,
            hint_prefix = " ",
            hint_inline = function()
                return false
            end,
            floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
                local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
                local pumheight = vim.o.pumheight
                local winline = vim.fn.winline() -- line number in the window
                local winheight = vim.fn.winheight(0)

                -- window top
                if winline - 1 < pumheight then
                    return pumheight
                end

                -- window bottom
                if winheight - winline < pumheight then
                    return -pumheight
                end
                return 0
            end,
            toggle_key = "<M-x>",
        })
    end,
}
