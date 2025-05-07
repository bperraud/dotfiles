local mason = require("mason-null-ls")

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

require("lspconfig").pyright.setup({
  root_dir = require("lspconfig.util").root_pattern("pyrightconfig.json", ".git")
})

