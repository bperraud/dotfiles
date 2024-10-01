vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('v', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', { noremap = true, silent = true })

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

-- format code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-s>", ':w<CR>');

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


vim.keymap.set("n", "<leader>e", function()
    local current_win = vim.api.nvim_get_current_win()
    if vim.fn.winnr('$') > 1 and vim.api.nvim_win_get_buf(current_win) == vim.fn.bufnr("NvimTree") then
        vim.cmd("wincmd p") -- Switch to previous window
    else
        vim.cmd("NvimTreeFocus")
    end
end, { silent = true })

vim.keymap.set(
    "n",
    "<C-o>",
    toggle_nvim_tree_without_focus, { noremap = true, silent = true }
--   ":NvimTreeToggle<CR>", { noremap = true, silent = true }
)

vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<BS>", "<gv", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<BS>", "<<", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- tooggle term
vim.keymap.set("n", "<leader>t", ":belowright split | terminal<CR>");

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>");
