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

-- grep in all files
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- format code
vim.g.user_emmet_expandabbr_key = '<C-y>'
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/dotfiles/scripts/tmux-windownizer.sh<CR>")

vim.keymap.set("n", "<C-s>", function()
    vim.cmd("w")
end, { noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

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
    "<C-n>",
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


local function get_terminal_buffers()
    local term_bufs = {}
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
            table.insert(term_bufs, buf)
        end
    end
    table.sort(term_bufs, function(a, b)
        return a > b -- sort buffers by IDs
    end)
    return term_bufs
end

local function toggle_term()
    local term_buffers = get_terminal_buffers()
    if vim.bo.buftype == "terminal" or (#term_buffers ~= 0 and vim.fn.bufwinnr(term_buffers[1]) > 0) then
        for _, buf_id in ipairs(term_buffers) do
            vim.api.nvim_win_hide(vim.fn.bufwinid(buf_id))
        end
    else
        -- open all terminal buffers
        for i, buf_id in ipairs(term_buffers) do
            if vim.api.nvim_buf_is_valid(buf_id) then
                if i == 1 then
                    vim.cmd("belowright split | b" .. buf_id) -- first one horizontaly
                else
                    vim.cmd("vsplit | b" .. buf_id)           -- vertically for subsequent terminals
                end
            end
        end
        -- new terminal buffer if none exist
        if #term_buffers == 0 then
            vim.cmd("belowright split | terminal")
        end
    end
end

local function split_term()
    if vim.bo.buftype == "terminal" then
        vim.cmd("vsp | wincmd l | term")
        return
    end
end

vim.keymap.set("n", "<C-t>", split_term);
vim.keymap.set("n", "<leader>t", toggle_term);

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>");
