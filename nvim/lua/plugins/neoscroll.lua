-- TODO: Implement scrolling based on cursor only and do scrolloff calculation
-- when moving the cursor.
local initial_scrolloff = 0
-- local initial_scrolloff = vim.opt.scrolloff:get()

return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup({
            mappings = { "<C-u>", "<C-d>" },
            hide_cursor = true, -- Hide cursor while scrolling
            stop_eof = true, -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil, -- Default easing function
            pre_hook = function()
                vim.opt.scrolloff = 0
            end, -- Function to run before the scrolling animation starts
            post_hook = function()
                vim.opt.scrolloff = initial_scrolloff
            end, -- Function to run after the scrolling animation ends
            performance_mode = false, -- Disable "Performance Mode" on all buffers.
        })
        local mappings = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        -- Move_Cursor, time, easing_function (constant = nil)
        mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "125", nil } }
        mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "125", nil } }
        require("neoscroll.config").set_mappings(mappings)
    end,
}
