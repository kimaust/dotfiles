return {
    "mxsdev/nvim-dap-vscode-js",
    build = "git clone https://github.com/microsoft/vscode-js-debug && cd vscode-js-debug && npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    config = function()
        require("dap-vscode-js").setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- Path to vscode-js-debug installation.
            debugger_path = vim.fn.stdpath("data") .. "/lazy/nvim-dap-vscode-js/vscode-js-debug",
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = {
                "pwa-node",
                "pwa-chrome",
                "pwa-msedge",
                "node-terminal",
                "pwa-extensionHost",
                -- "node",
                -- "chrome",
            }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        local js_based_languages = { "typescript", "javascript", "typescriptreact" }
        for _, language in ipairs(js_based_languages) do
            require("dap").configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Auto Attach",
                    cwd = vim.fn.getcwd(),
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = 'Start Chrome with "localhost"',
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                },
            }
        end

        -- for _, language in ipairs({ "typescript", "javascript" }) do
        --     require("dap").configurations[language] = {
        --         ..., -- see below
        --     }
        -- end
    end,
}
