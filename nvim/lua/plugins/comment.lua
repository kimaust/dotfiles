return {
    "numToStr/Comment.nvim",
    config = function()
        local comment = require("Comment")
        comment.setup()

        local api = require("Comment.api")
        vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, { noremap = true })
    end,
}
