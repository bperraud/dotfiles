local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set("n", "<C-b>", ":Telescope lsp_references<CR>");

-- grep in all files
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })
