-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

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
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,  -- Disable window picker
      },
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    -- Default key mappings
    api.config.mappings.default_on_attach(bufnr)
    -- Custom mappings
    vim.keymap.set("n", "i", api.fs.rename, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set("n", "o", api.fs.create, { buffer = bufnr, noremap = true, silent = true })
  end,
})

-- Setup devicons (optional)
require('nvim-web-devicons').setup {
  default = true, -- Ensures that default icons are used
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "html", "javascript", "typescript", "json", "bash", "yaml", "c", "vim", "cpp", "dockerfile", "go", "helm", "htmldjango", "nginx", "php", "rust"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

