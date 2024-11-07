-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
   actions = {
    open_file = {
      window_picker = {
        enable = false,  -- Disable window picker
      },
    },
  },
  filters = {
    dotfiles = false,
  },
})

require('nvim-web-devicons').setup {
	default = true;  -- Ensures that default icons are used
}


--keymap
require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    -- Call the default `on_attach` first to include the default mappings
    api.config.mappings.default_on_attach(bufnr)
    -- Add your custom keymap for renaming
    vim.keymap.set("n", "i", api.fs.rename, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set("n", "o", api.fs.create, { buffer = bufnr, noremap = true, silent = true })
  end,
})

-- -- empty setup using defaults
-- require("nvim-tree").setup()
