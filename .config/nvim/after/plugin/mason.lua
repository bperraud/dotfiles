-- local mason = require("mason-null-ls")
local mason = require("mason")
local lspconfig = require("lspconfig")
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
        "clangd",
        "debugpy",
        "mypy",
        "pyright",
        "html",
        "ts_ls",
        "gopls",
        "vls",
        "json-lsp",
        "codelldb",
        -- "volar",
        "helm_ls",
        "django-template-lsp",
        "lua-language-server",
        "eslint-lsp"
    }
})

lspconfig.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

-- Attach capabilities for autocompletion (optional but recommended)
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure pyright
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require("lspconfig.util").root_pattern("pyrightconfig.json", ".git")

})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- ✅ Tell LSP that 'vim' is a global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- ✅ Make LSP aware of Neovim runtime
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    }
  }
})

local servers = {
    "ts_ls",
    "gopls",
    "helm_ls",
    "clangd",
    -- "vls",
    -- "volar",
    -- "eslint"
}

-- require("lspconfig").vls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "vue", "javascript", "typescript" },
-- })

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- lspconfig.eslint.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
})

-- Configure django-lsp
lspconfig.djlsp.setup({
    filetypes = { "htmldjango"},
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/djlsp" },
    -- init_options = {
    --     -- django_settings_module = "your_project.settings",
    --     docker_compose_file = "docker-compose.yaml",
    --     docker_compose_service = "django"
    -- },
    on_attach = on_attach,
    capabilities = capabilities
})


vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
  },
  signs = true,
  underline = true,  -- underline problematic code
  update_in_insert = false,
  severity_sort = true,
  float = {
    source = "always",   -- always show the source of the diagnostic (like pyright)
    border = "rounded",
  },
})

