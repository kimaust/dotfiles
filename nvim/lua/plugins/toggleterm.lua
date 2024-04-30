return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        -- TODO: Put this into a separate file.
        -- Workaround for MSYS2. Currently, fzf only supports cmd shell on
        -- Windows.

        local toggleterm = require("toggleterm")
        toggleterm.setup({
            shade_terminals = false,
        })

        -- local desired_shell = "C:/msys64/usr/bin/zsh.exe"
        -- vim.opt.shell = desired_shell
        vim.keymap.set({ "n", "i", "v", "t" }, "<C-t>", function()
            -- WTF? Why dos this work?
            -- local desired_shell = "C:/msys64/usr/bin/zsh.exe"
            -- vim.opt.shell = desired_shell
            -- vim.opt.shellcmdflag = "-c"
            vim.cmd("ToggleTerm")
            -- if vim.fn.has("win32") or vim.fn.has("win64") then
            --     vim.opt.shell = "cmd"
            -- end
        end, { noremap = true, silent = true })
    end,
}
