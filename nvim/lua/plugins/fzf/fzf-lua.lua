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
                width = 0.90,
                height = 0.90,
                preview = {
                    -- Defualt bat highlighting looks garbage, so use the builtin
                    -- until I can figure out how to override theme.
                    default = "builtin",
                    layout = "vertical",
                },
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
            invoke_with_shell("FzfLua live_grep_native"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "i", "v" },
            "<C-S-f>",
            invoke_with_shell("FzfLua grep"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "v" },
            "<leader>sk",
            invoke_with_shell("FzfLua keymaps"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "v" },
            "<leader>sh",
            invoke_with_shell("FzfLua helptags"),
            { silent = true }
        )

        vim.keymap.set(
            { "n", "v" },
            "<leader>of",
            invoke_with_shell("FzfLua oldfiles"),
            { silent = true }
        )

        local dir_switcher = function(opts)
            opts = opts or {}
            opts.prompt = "Directories> "
            opts.fn_transform = function(x)
                return fzf_lua.utils.ansi_codes.magenta(x)
            end
            opts.actions = {
                ["default"] = function(selected)
                    vim.cmd("cd " .. selected[1])
                end,
            }
            fzf_lua.fzf_exec("fd -H --type d", opts)
        end
        vim.keymap.set(
            { "n", "v" },
            "<leader>cd",
            invoke_with_shell(dir_switcher),
            { silent = true }
        )
    end,
}
