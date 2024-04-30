local M = {}

function M.invoke_with_shell(command, default_shell, cond)
    default_shell = default_shell or "cmd"
    cond = cond or vim.fn.has("win32") or vim.fn.has("win64")

    return function()
        local initial_shell = vim.opt.shell:get()
        if cond then
            vim.opt.shell = default_shell
        end
        if type(command) == "string" then
            vim.cmd(command)
        else
            command()
        end
        vim.opt.shell = initial_shell
    end
end

return M
