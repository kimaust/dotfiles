return {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
    -- HACK: Temp fix for a bug that fails to open in float window in lastest versoin.
    tag = "v2.8.0",
    config = function()
        local oil = require("oil")
        local actions = require("oil.actions")
        local utils = require("utils")
        oil.setup({
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["<C-p>"] = false,
                ["<C-s>"] = false,
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set({ "n", "i", "v" }, "<C-e>", function()
            oil.toggle_float()
            -- if vim.bo.filetype == "oil" then
            --     oil.close()
            -- else
            --     oil.open()
            -- end
        end, { noremap = true, silent = true })
    end,
}
