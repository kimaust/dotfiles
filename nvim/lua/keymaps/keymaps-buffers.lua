vim.keymap.set({ "n", "i", "v" }, "<C-Tab>", "<Cmd>bn<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-S-Tab>", "<Cmd>bp<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", function()
    local listed_bufs = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted")
    end, vim.api.nvim_list_bufs())

    if #listed_bufs == 1 then
        vim.cmd("bd")
        return
    end

    local cur_buf = vim.api.nvim_get_current_buf()
    local first_buf = cur_buf == listed_bufs[1]
    -- print(first_buf)
    -- print(cur_buf)
    if first_buf then
        vim.cmd("bn")
    else
        vim.cmd("bp")
    end
    vim.cmd("bd#")
end, { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-a>", "<C-^>", { noremap = true, silent = true })
