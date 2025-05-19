-- local mason = require("mason-null-ls")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local mason_null_ls = require("mason-null-ls")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

mason.setup({
    ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "pyright",
        "html",
        "ts_ls",
        "gopls",
        "vue-language-server",
        "helm_ls",
        "django-template-lsp"
    }
})

-- Attach capabilities for autocompletion (optional but recommended)
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure pyright
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require("lspconfig.util").root_pattern("pyrightconfig.json", ".git")

})

-- Configure tsserver (TypeScript)
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configure clangd (C/C++)
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Configure html
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
})

-- Configure django-lsp
lspconfig.djlsp.setup{
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/djlsp" },
    init_options = {
        django_settings_module = "your_project.settings",
        docker_compose_file = "docker-compose.yaml",
        docker_compose_service = "django"
    },
    on_attach = on_attach,
    capabilities = capabilities
}
