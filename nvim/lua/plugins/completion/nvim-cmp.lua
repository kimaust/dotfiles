return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Completion source for neovim's built-in language server client.
        { "hrsh7th/cmp-nvim-lsp", lazy = false },
        { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false },
        { "hrsh7th/cmp-nvim-lsp-document-symbol", lazy = false },
        -- { "Jezda1337/nvim-html-css", lazy = false },
        { "JMarkin/cmp-diag-codes", lazy = false },
        -- Completion source for recommending text within the buffer.
        { "hrsh7th/cmp-buffer", lazy = false },
        -- Completion source for file system path
        { "hrsh7th/cmp-path", lazy = false },
        -- Snippet engine
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            version = "v2.*",
            lazy = false,
            -- install jsregexp (optional!).
            -- build = "make install_jsregexp",
        },
        -- Completion source for the lua snippet engine
        { "saadparwaiz1/cmp_luasnip", lazy = false },
        -- Completion source for command line
        { "hrsh7th/cmp-cmdline", lazy = false },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local ELLIPSIS_CHAR = "…"
        local MAX_LABEL_WIDTH = 20
        local MIN_LABEL_WIDTH = 20
        cmp.setup({
            performance = {
                -- debounce = 100,
                -- throttle = 100,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- Make it bordered.
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),
                ["<C-k>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s", "c" }),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-c>"] = cmp.mapping.complete(),
                ["<C-a>"] = cmp.mapping.abort(),
                -- ["<C-a>"] = ,
                -- Accept currently selected item. Set `select` to `false` to
                -- only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 100 },
                { name = "nvim_lsp_signature_help", priority = 99 },
                { name = "luasnip" },
                -- {
                --     name = "html-css",
                --     option = {
                --         -- your configuration here
                --     },
                -- },
                {
                    name = "diag-codes",
                    -- default completion available only in comment context
                    -- use false if you want to get in other context
                    option = { in_comment = true },
                },
                -- { name = "copilot", priority = 0 },
            }, {
                { name = "path" },
                -- { name = "buffer" },
            }),
            sorting = {
                priority_weight = 1.0,
                comparators = {
                    cmp.config.compare.exact,
                    cmp.config.compare.offset,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                    -- require("copilot_cmp.comparators").prioritize,
                },
            },
            formatting = {
                format = function(entry, vim_item)
                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                    if truncated_label ~= label then
                        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                    elseif string.len(label) < MIN_LABEL_WIDTH then
                        local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
                        vim_item.abbr = label .. padding
                    end
                    return vim_item
                end,
            },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            sources = {
                { name = "nvim_lsp_document_symbol" },
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            sources = cmp.config.sources({
                { name = "cmdline" },
            }, {
                { name = "path" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
