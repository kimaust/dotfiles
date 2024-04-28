return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neodev.nvim", lazy = false },
    },
    config = function()
        -- Set up neodev before LSP config.
        require("neodev").setup({})

        -- Show source for the diagnostics.
        vim.diagnostic.config({
            float = {
                source = true,
            },
        })

        local utils = require("utils")
        local invoke_with_shell = utils.invoke_with_shell

        -- vim.keymap.set({ "n", "i" }, "<M-h>", vim.lsp.buf.hover, {})
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- vim.keymap.set("n", "<leader>sd", "<Cmd>Telescope diagnostics bufnr=0<CR>", {})

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "gd", invoke_with_shell("FzfLua lsp_definitions"), opts)
                vim.keymap.set("n", "gD", invoke_with_shell("FzfLua lsp_declarations"), opts)
                vim.keymap.set("n", "gt", invoke_with_shell("FzfLua lsp_typedefs"), opts)
                vim.keymap.set("n", "gi", invoke_with_shell("FzfLua lsp_implementations"), opts)
                vim.keymap.set("n", "gr", invoke_with_shell("FzfLua lsp_references"), opts)
                vim.keymap.set("n", "<M-i>", invoke_with_shell("FzfLua lsp_incoming_calls"), opts)
                vim.keymap.set("n", "<M-o>", invoke_with_shell("FzfLua lsp_outgoing_calls"), opts)
                -- vim.keymap.set(
                --     { "n", "i", "v" },
                --     "<M-d>",
                --     invoke_with_shell("FzfLua lsp_document_diagnostics"),
                --     opts
                -- )
                -- vim.keymap.set(
                --     { "n", "i", "v" },
                --     "<M-S-d>",
                --     invoke_with_shell("FzfLua lsp_workspace_diagnostics"),
                --     opts
                -- )
                vim.keymap.set(
                    { "n", "v" },
                    "<M-a>",
                    vim.lsp.buf.code_action,
                    -- invoke_with_shell("FzfLua lsp_code_actions"),
                    opts
                )
                vim.keymap.set({ "n", "i", "v" }, "<M-j>", invoke_with_shell("FzfLua jumps"), opts)
                vim.keymap.set({ "n", "i" }, "<M-r>", vim.lsp.buf.rename, opts)
                -- vim.keymap.set({ "n", "i" }, "<M-S-h>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set({ "n", "v", "i" }, "<M-d>", vim.diagnostic.open_float)
                vim.keymap.set({ "n", "v", "i" }, "<M-l>", vim.diagnostic.setloclist, opts)
                -- vim.keymap.set({ "n", "v", "i" }, "<M-q>", vim.diagnostic.setqflist, opts)
                vim.keymap.set({ "n", "i", "v" }, "<M-n>", vim.diagnostic.goto_next, opts)
                vim.keymap.set({ "n", "i", "v" }, "<M-S-n>", vim.diagnostic.goto_prev, opts)

                -- Completion,  format, vim.lsp.omnifunc, vim.lsp.tagfunc

                -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wl", function()
                -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
            end,
        })
    end,
}
