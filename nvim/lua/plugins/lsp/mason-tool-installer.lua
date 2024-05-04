return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        local mason_tool_installer = require("mason-tool-installer")

        mason_tool_installer.setup({
            ensure_installed = {
                "bash-language-server",
                "djlint",
                "eslint_d",
                "editorconfig-checker",
                "htmlhint",
                -- "stylua",
                -- Fails on MSYS, need to check.
                -- "luacheck",
                "lua-language-server",
                "prettierd",
                "stylelint",
                "sonarlint-language-server",
                "shellcheck",
                "vim-language-server",
                -- "misspell",
            },
            auto_update = false,
            run_on_start = true,
        })
    end,
}
