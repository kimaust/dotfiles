return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        {
            "mfussenegger/nvim-dap",
            lazy = false,
        },
        {
            "nvim-neotest/nvim-nio",
            lazy = false,
        },
    },
    config = function()
        local dapui = require("dapui")
        dapui.setup()

        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
        end

        vim.keymap.set("n", "<leader>ui", dapui.toggle)
    end,
}
