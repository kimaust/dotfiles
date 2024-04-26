return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        local fzf_opts = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
        telescope.setup({
            defaults = {
                -- Add debounce of 100ms to workaround slowness in big projects.
                debounce = 100,
                layout_strategy = "vertical",
                sorting_strategy = "ascending",
                selection_strategy = "reset",
                scroll_strategy = "limit",
                layout_config = {
                    vertical = {
                        prompt_position = "top",
                    },
                },
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key",
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                    n = {
                        ["<C-c>"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    -- find_command = { "fdfind", "--type", "f", "--no-ignore" },
                    previewer = false,
                    -- sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts),
                    -- ivy, dropdown, cursor
                    -- NOTE: Overrides the global layout_strategy
                    --theme = "dropdown",
                },
            },
            extensions = {
                fzf = fzf_opts,
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("noice")

        -- local builtin = require("telescope.builtin")
        -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})

        vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope file_browser<CR>", {})
        -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        -- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
        -- vim.keymap.set("n", "<leader>fm", builtin.man_pages, {})
        -- vim.keymap.set("n", "<leader>fr", builtin.registers, {})
        -- vim.keymap.set("n", "<leader>bl", builtin.buffers, {})
        -- vim.keymap.set("n", "<leader>sf", builtin.current_buffer_fuzzy_find, {})
        -- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
        -- vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        -- vim.keymap.set("n", "<leader>gbc", builtin.git_bcommits, {})
        -- vim.keymap.set("n", "<leader>gbr", builtin.git_branches, {})
        -- vim.keymap.set("n", "<leader>gst", builtin.git_status, {})
        -- vim.keymap.set("n", "<leader>gsh", builtin.git_stash, {})
    end,
}
