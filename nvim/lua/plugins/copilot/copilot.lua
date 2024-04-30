return {
    "zbirenbaum/copilot.lua",
    config = function()
        local copilot = require("copilot")
        copilot.setup({
            panel = {
                enabled = true,
                -- Automatically refresh the panel when the file changes.
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                enabled = true,
                -- Suggest after entering insert mode.
                auto_trigger = true,
                debounce = 100,
                keymap = {
                    accept = "<C-CR>",
                    accept_word = "<S-Tab>",
                    accept_line = "<S-Down>",
                    next = "<S-Right>",
                    prev = "<S-Left>",
                    dismiss = false,
                },
            },
            server_opts_overrides = {
                trace = "verbose",
                settings = {
                    advanced = {
                        --length = 500,
                        listCount = 5,
                        inlineSuggestCount = 3,
                    },
                },
            },
        })
        vim.keymap.set(
            "n",
            "<leader>op",
            "<cmd>Copilot panel<CR>",
            { noremap = true, silent = true, desc = "Open copilot panel." }
        )
        vim.keymap.set(
            "n",
            "<leader>tc",
            "<cmd>Copilot toggle<CR>",
            { noremap = true, silent = true, desc = "Toggle copilot." }
        )
    end,
}
