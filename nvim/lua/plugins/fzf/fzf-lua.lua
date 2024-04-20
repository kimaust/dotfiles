return {
    "ibhagwan/fzf-lua",
    -- Optional dependency for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Workaround for MSYS2. Currently, fzf only supports cmd shell on
        -- Windows.
        local initial_shell = vim.opt.shell:get()
        local fzf_wrapper = function(fzf_command)
            return function()
                if vim.fn.has("win32") or vim.fn.has("win64") then
                    vim.opt.shell = "cmd"
                end
                vim.cmd(fzf_command)
                vim.opt.shell = initial_shell
            end
        end

        -- Calling `setup` is optional for customization.
        local fzf_lua = require("fzf-lua")
        local actions = require("fzf-lua.actions")
        fzf_lua.setup({
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
                actions = {
                    ["ctrl-g"] = function()
                        if vim.fn.has("win32") or vim.fn.has("win64") then
                            vim.opt.shell = "cmd"
                        end
                        actions.toggle_ignore()
                        vim.opt.shell = initial_shell
                    end,
                },
            },
            defaults = {
                git_icons = false,
                file_icons = false,
            },
        })
        vim.keymap.set({ "n", "i", "v" }, "<C-p>", fzf_wrapper("FzfLua files"), { silent = true })

        -- vim.keymap.set({"n", "i", "v"}, "g"
        vim.keymap.set({ "n", "i", "v" }, "<C-b>", fzf_wrapper("FzfLua buffers"), { silent = true })

        vim.keymap.set(
            { "n", "i", "v" },
            "<C-f>",
            fzf_wrapper("FzfLua live_grep"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<leader>of",
            fzf_wrapper("FzfLua oldfiles"),
            { silent = true }
        )
    end,
}
