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

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<leader>oid", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>od", vim.diagnostic.setloclist)
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>sd", "<Cmd>Telescope diagnostics bufnr=0<CR>", {})
        -- vim.keymap.set("n", "<leader>sD", telescope_builtin.diagnostics, {})

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

                local utils = require("utils")
                local invoke_with_shell = utils.invoke_with_shell

                vim.keymap.set("n", "gd", invoke_with_shell("FzfLua lsp_definitions"), opts)
                vim.keymap.set("n", "gD", invoke_with_shell("FzfLua lsp_declarations"), opts)
                vim.keymap.set("n", "gt", invoke_with_shell("FzfLua lsp_typedefs"), opts)
                vim.keymap.set("n", "gi", invoke_with_shell("FzfLua lsp_implementations"), opts)
                vim.keymap.set("n", "<leader>lr", invoke_with_shell("FzfLua lsp_references"), opts)
                vim.keymap.set(
                    "n",
                    "<leader>lic",
                    invoke_with_shell("FzfLua lsp_incoming_calls"),
                    opts
                )
                vim.keymap.set(
                    "n",
                    "<leader>loc",
                    invoke_with_shell("FzfLua lsp_outgoing_calls"),
                    opts
                )

                vim.keymap.set(
                    { "n", "v" },
                    "<leader>ca",
                    invoke_with_shell("Fzflua lsp_code_actions"),
                    opts
                )

                -- vim.keymap.set("n", "<leader>ls", telescope_builtin.lsp_document_symbols, opts)
                vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)

                vim.keymap.set({ "n", "i" }, "<M-h>", vim.lsp.buf.hover, opts)
                vim.keymap.set({ "n", "i" }, "<M-S-h>", vim.lsp.buf.signature_help, opts)

                -- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                -- vim.keymap.set("n", "<leader>wl", function()
                -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)

                -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            end,
        })
    end,
}
