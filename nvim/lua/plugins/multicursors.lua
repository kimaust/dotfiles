return {
    "smoka7/multicursors.nvim",
    dependencies = {
        { "smoka7/hydra.nvim", lazy = false },
    },
    config = function()
        -- cmd = {
        -- "MCstart", "MCvisual", "MCclear", "MCpattern",
        -- "MCvisualPattern", "MCunderCursor"
        -- },
        local multicursors = require("multicursors")
        multicursors.setup({})

        vim.keymap.set({ "v", "n" }, "<M-m>", "<Cmd>MCstart<CR>", {
            noremap = true,
            desc = "Create a selection for selected text or word under the cursor",
        })

        -- Set highlight for multicursor to match colorscheme.
        local search_hl = vim.api.nvim_get_hl(0, { name = "Search" })
        local cur_search_hl = vim.api.nvim_get_hl(0, { name = "CurSearch" })
        vim.api.nvim_set_hl(0, "MultiCursor", search_hl)
        vim.api.nvim_set_hl(0, "MultiCursorMain", cur_search_hl)
    end,
}
