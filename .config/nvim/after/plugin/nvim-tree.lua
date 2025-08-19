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

-- keymap
vim.keymap.set("n", "<leader>e", function()
    local current_win = vim.api.nvim_get_current_win()
    if vim.fn.winnr('$') > 1 and vim.api.nvim_win_get_buf(current_win) == vim.fn.bufnr("NvimTree") then
        vim.cmd("wincmd p") -- Switch to previous window
    else
        vim.cmd("NvimTreeFocus")
    end
end, { silent = true })

local function toggle_nvim_tree_without_focus()
    local current_window_id = vim.api.nvim_get_current_win()
    vim.cmd('NvimTreeToggle')
    vim.api.nvim_set_current_win(current_window_id)
end

vim.keymap.set(
    "n",
    "<C-n>",
    toggle_nvim_tree_without_focus, { noremap = true, silent = true }
)
