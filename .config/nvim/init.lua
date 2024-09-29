require("bperraud.remap")
require("bperraud.set")

vim.cmd([[
  augroup DisableWriteWarnings
    autocmd!
    autocmd BufWritePre nvim/after/plugin/lsp.lua set nowritebackup
    autocmd BufWritePre /path/to/another/file set nowritebackup
  augroup END
]])

-- Automatically enter Insert Mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end,
})

vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "terminal" then
            vim.cmd("startinsert")
        end
    end,
})
