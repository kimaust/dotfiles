return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local lspconfig = require("lspconfig")
        local configs = require("mason-lspconfig")

        configs.setup({
            ensure_installed = {
                --"asm_lsp",
                "lua_ls",
                "jsonls",
                "clangd",
                "emmet_language_server",
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
                lspconfig[server_name].setup({})
            end,
            ["jsonls"] = function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities.textDocument.completion.completionItem.snippetSupport = true

                lspconfig.jsonls.setup({
                  capabilities = capabilities,
                    filetypes = {
                        "json",
                        "jsonc",
                        "prettierrc"
                    }
                })
            end,
            ["lua_ls"] = function()
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
            ["emmet_language_server"] = function()
                lspconfig.emmet_language_server.setup({
                    filetypes = {
                        "css",
                        "eruby",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "less",
                        "sass",
                        "scss",
                        "pug",
                        "typescriptreact",
                    },
                })
            end,
        })
    end,
}
