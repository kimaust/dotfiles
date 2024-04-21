return {
    "smoka7/multicursors.nvim",
    dependencies = {
        { "smoka7/hydra.nvim", lazy = false },
    },
    lazy = false,
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
        {
            mode = { "v", "n" },
            "<Leader>m",
            "<cmd>MCstart<cr>",
            desc = "Create a selection for selected text or word under the cursor",
        },
    },
}
