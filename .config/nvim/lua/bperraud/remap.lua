vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('v', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<C-c>", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !~/dotfiles/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set(
--     "n",
--     "<leader>ee",
--     "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
-- )

local function toggle_nvim_tree_without_focus()
    local current_window_id = vim.api.nvim_get_current_win()
    vim.cmd('NvimTreeToggle')
    vim.api.nvim_set_current_win(current_window_id)
end

--vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set(
    "n",
    "<leader>e",
    ":NvimTreeFocus<CR>", { silent = true }
)

vim.keymap.set(
    "n",
    "<C-n>",
    toggle_nvim_tree_without_focus, { silent = true }
)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)



-- tooggle term
vim.keymap.set("n", "<leader>t", ":belowright split | terminal<CR>");

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>");
