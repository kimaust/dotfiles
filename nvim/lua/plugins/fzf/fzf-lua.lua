return {
    "ibhagwan/fzf-lua",
    -- Optional dependency for icon support
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = false },
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
                    -- Defualt bat highlighting looks garbage, so use the builtin
                    -- until I can figure out how to override theme.
                    default = "builtin",
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
            grep = {},
            defaults = {
                git_icons = false,
                file_icons = false,
            },
        })
        local utils = require("utils")
        local invoke_with_shell = utils.invoke_with_shell

        vim.keymap.set(
            { "n", "i", "v" },
            "<C-p>",
            invoke_with_shell("FzfLua files"),
            { silent = true }
        )

        -- vim.keymap.set({"n", "i", "v"}, "g"
        vim.keymap.set(
            { "n", "i", "v" },
            "<C-b>",
            invoke_with_shell("FzfLua buffers"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<C-f>",
            invoke_with_shell("FzfLua live_grep"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<leader>sk",
            invoke_with_shell("FzfLua keymaps"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<leader>of",
            invoke_with_shell("FzfLua oldfiles"),
            { silent = true }
        )
    end,
}
