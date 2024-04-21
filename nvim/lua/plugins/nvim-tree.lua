local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
    "nvim-tree/nvim-tree.lua",
    cond = not vim.g.vscode,
    config = function()
        local nvim_tree = require("nvim-tree")
        nvim_tree.setup({
            view = {
                width = "30%",
                side = "right",
            },
            -- on_attach = my_on_attach,
        })

        -- custom mappings
        vim.keymap.set("n", "<leader>ft", "<Cmd>NvimTreeToggle<CR>", {})
    end,
}
