require("bperraud.remap")
require("bperraud.set")

vim.cmd([[
  augroup DisableWriteWarnings
    autocmd!
    autocmd BufWritePre nvim/after/plugin/lsp.lua set nowritebackup
    autocmd BufWritePre /path/to/another/file set nowritebackup
  augroup END
]])

