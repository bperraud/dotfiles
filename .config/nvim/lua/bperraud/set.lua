vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = false
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', space = '·' }

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime"
})

vim.cmd([[
  augroup DisableWriteWarnings
    autocmd!
    autocmd BufWritePre nvim/after/plugin/lsp.lua set nowritebackup
    autocmd BufWritePre /path/to/another/file set nowritebackup
  augroup END
]])

vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "terminal" then
            vim.cmd("startinsert")
        end
    end,
})
