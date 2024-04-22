return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup({
            ensure_installed = {
                "djlint",
                "prettierd",
                "eslint_d",
                -- "stylua",
                -- Fails on MSYS, need to check.
                -- "luacheck",
                "bash-language-server",
                "lua-language-server",
                "vim-language-server",
                "shellcheck",
                -- "misspell",
                "editorconfig-checker",
            },
            auto_update = false,
            run_on_start = true,
        })
    end,
}
