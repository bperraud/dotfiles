
local lsp = require("lsp-zero")

lsp.preset("recommended")

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.preset("recommended")

-- lsp.ensure_installed({
--   'lua_ls',
--   'pyright',
--   'clangd',
--   'eslint',
--   'html'
-- })
--
--

-- require('lspconfig').ts_ls.setup({})
-- require('lspconfig').html.setup({})

lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

lsp.configure("eslint", {
  on_init = function(client)
    client.config.settings.workingDirectory = { directory = client.config.root_dir }
  end,
})

require('lspconfig').templ.setup({
    cmd = { "templ", "lsp", "-http=localhost:7474", "-log=/home/mpaulson/templ.log" },
    filetypes = { 'templ' },
})


local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<Tab>"] = cmp.mapping.confirm(cmp_select),
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<CR>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    attach(opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
