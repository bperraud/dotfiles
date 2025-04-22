local mason = require("mason-null-ls")

mason.setup({
    ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "pyright",
        "html",
        "ts_ls",
        "html",
        "gopls",
        "vue-language-server",
        "helm_ls",
        "django-template-lsp"
    }
})

