return {
    "numToStr/Comment.nvim",
    config = function()
        local comment = require("Comment")
        comment.setup()

        local api = require("Comment.api")
        -- I have no idea why <C-/> works, but <C-_> doesn't.
        vim.keymap.set({ "n", "i", "v" }, "<C-/>", function()
            api.toggle.linewise.current()
        end, { noremap = true, unique = true })
    end,
}
