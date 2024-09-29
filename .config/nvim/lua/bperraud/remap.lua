vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<C-c>", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- tooggle term
vim.keymap.set("n", "<leader>t",":belowright split | terminal<CR>");


-- ToggleTerm

function toggle_term_or_close()
    -- Check if any terminal window is open
    if vim.fn.empty(vim.fn.filter(vim.fn.range(1, vim.fn.winnr('$')), 'getwinvar(v:val, "&buftype") == "terminal"')) == 0 then
        -- Close the terminal window
        vim.cmd('silent! :q')
    else
        -- Open the terminal window
        vim.cmd('ToggleTerm')
    end
end

-- Toggle terminal window with F12 key
--vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua toggle_term_or_close()<CR>', { noremap = true })

--vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm<CR>', { noremap = true })
--vim.api.nvim_set_keymap('i', '<leader>t', '<cmd>ToggleTerm<CR>', { noremap = true })

--vim.api.nvim_set_keymap('n', '<C-1>', '<C-\\><C-n>:ToggleTermClose<CR>', { noremap = true })
--vim.api.nvim_set_keymap('n', '<leader>t', '<C-\\><C-n>:ToggleTermClose<CR>', { noremap = true })
--vim.api.nvim_set_keymap('i', '<leader>t', '<C-\\><C-n>:ToggleTermClose<CR>', { noremap = true })

