return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        -- TODO: Put this into a separate file.
        -- Workaround for MSYS2. Currently, fzf only supports cmd shell on
        -- Windows.
        local initial_shell = vim.opt.shell:get()

        local toggleterm = require("toggleterm")
        toggleterm.setup({
            shade_terminals = false,
        })

        vim.keymap.set({ "n", "i", "v", "t" }, "<C-t>", function()
            if vim.fn.has("win32") or vim.fn.has("win64") then
                vim.opt.shell = "cmd"
            end
            vim.cmd("ToggleTerm")
            vim.opt.shell = initial_shell
        end, { noremap = true, silent = true })
    end,
}
