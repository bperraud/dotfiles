-- Disable global Emmet installation
vim.g.user_emmet_install_global = 0

-- Set up autocmd to install Emmet on specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css" },
  callback = function()
    vim.cmd("EmmetInstall")
  end,
})
