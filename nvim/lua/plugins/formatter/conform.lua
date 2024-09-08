return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                -- TODO: Use LSP lua formatter
                lua = { "stylua" },
                html = { "prettierd" },
                css = { "prettierd" },
                json = { "prettierd" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                pug = { "prettierd" },
                handlebars = { "prettierd" },
                ejs = { "prettierd" },
                python = { "autopep8" }
            },
            -- Set up format on save
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    async = false,
                    timeout_ms = 500,
                    lsp_fallback = false,
                    quiet = true,
                    -- Turn off notify on error to allow saving files with errors.
                    -- notify_on_error = false,
                }
            end,
        })
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = "Disable autoformat-on-save",
            bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = "Re-enable autoformat-on-save",
        })

        vim.keymap.set({ "n", "v" }, "<leader>rf", function()
            conform.format({
                async = false,
                lsp_fallback = false,
                quiet = true,
            })
        end, { desc = "Format file or range in visual mode." })
    end,
}
