return {
    "ibhagwan/fzf-lua",
    -- Optional dependency for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Calling `setup` is optional for customization.
        require("fzf-lua").setup({
            winopts = {
                preview = {
                    default = "bat",
                },
            },
            manpages = {
                previewer = "man_native",
            },
            helptags = {
                previewer = "help_native",
            },
            lsp = {
                code_actions = {
                    previewer = "codeaction_native",
                },
            },
            tags = {
                previewer = "bat",
            },
            btags = {
                previewer = "bat",
            },
            files = {
                previewer = false,
                fzf_opts = {
                    ["--ansi"] = false,
                },
            },
            defaults = {
                git_icons = false,
                file_icons = false,
            },
        })

        vim.keymap.set({ "n", "i", "v" }, "<C-p>", "<cmd>FzfLua files<CR>", { silent = true })
        -- vim.keymap.set({"n", "i", "v"}, "g"
        vim.keymap.set({ "n", "i", "v" }, "<C-b>", "<cmd>FzfLua buffers<CR>", { silent = true })
        vim.keymap.set({ "n", "i", "v" }, "<C-f>", "<cmd>FzfLua live_grep<CR>", { silent = true })

        vim.keymap.set(
            { "n", "i", "v" },
            "<leader>of",
            "<cmd>FzfLua oldfiles<CR>",
            { silent = true }
        )
    end,
}
