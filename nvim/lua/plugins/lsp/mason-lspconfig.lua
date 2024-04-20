return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local configs = require("mason-lspconfig")

        configs.setup({
            ensure_installed = {
                --"asm_lsp",
                "lua_ls",
                "jsonls",
                "clangd",
                -- Needs to be replaced by VSCode C# LSP when supported,
                -- use VSCode instead for now.
                -- "omnisharp",
                -- "rust_analyzer",
                "vimls",
                "bashls",
                "awk_ls",
                "html",
                "cssls",
                "tsserver",
                "tailwindcss",
            },
            automatic_installation = true,
        })
        configs.setup_handlers({
            function(server_name)
                local lspconfig = require("lspconfig")
                lspconfig[server_name].setup({})
            end,
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            format = {
                                enable = true,
                                defaultConfig = {
                                    max_line_length = 80,
                                },
                            },
                        },
                    },
                })
            end,
        })
    end,
}
