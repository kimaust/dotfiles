return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Completion source for neovim's built-in language server client.
        { "hrsh7th/cmp-nvim-lsp", lazy = false },
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

        cmp.setup({
            performance = {
                debounce = 100,
                throttle = 100,
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
                -- ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- ["<C-j>"] = cmp.mapping.select_next_item(),
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
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            -- mapping = cmp.mapping.preset.cmdline(),
            -- mapping = cmp.mapping.preset.insert({
            -- 	["<C-k>"] = cmp.mapping.select_prev_item(),
            -- 	["<C-j>"] = cmp.mapping.select_next_item(),
            -- 	-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            -- 	-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
            -- 	["<C-Space>"] = cmp.mapping.complete(),
            -- 	["<C-c>"] = cmp.mapping.abort(),
            -- 	-- Accept currently selected item. Set `select` to `false` to
            -- 	-- only confirm explicitly selected items.
            -- 	["<CR>"] = cmp.mapping.confirm({ select = false }),
            -- }),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            -- mapping = cmp.mapping.preset.cmdline(),
            -- mapping = cmp.mapping.preset.cmdline({
            -- 	["<C-k>"] = cmp.mapping.select_prev_item(),
            -- 	["<C-j>"] = cmp.mapping.select_next_item(),
            -- }),
            -- mapping = cmp.mapping.preset.insert({
            -- 	["<C-k>"] = cmp.mapping.select_prev_item(),
            -- 	["<C-j>"] = cmp.mapping.select_next_item(),
            -- 	-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            -- 	-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
            -- 	["<C-Space>"] = cmp.mapping.complete(),
            -- 	["<C-c>"] = cmp.mapping.abort(),
            -- 	-- Accept currently selected item. Set `select` to `false` to
            -- 	-- only confirm explicitly selected items.
            -- 	["<CR>"] = cmp.mapping.confirm({ select = false }),
            -- }),
            sources = cmp.config.sources({
                { name = "cmdline" },
            }, {
                { name = "path" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
