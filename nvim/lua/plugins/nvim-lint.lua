return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            lua = { "luacheck" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
        }

        local lua = lint.linters.luacheck
        lua.args = {
            "--globals",
            "vim",
            "--",
        }

        local eslint = lint.linters.eslint_d
        eslint.args = {
            -- Supress warnings about missing .eslintrc
            "--no-warn-ignored",
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
            pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.lua" },
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
        vim.keymap.set("n", "<leader>rl", function()
            lint.try_lint()
        end, { desc = "Run linter for current file." })
    end,
}
