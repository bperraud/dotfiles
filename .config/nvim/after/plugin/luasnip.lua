local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-i>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.setup({
    enable_autosnippets = true,
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave'
})
