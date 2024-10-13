local mason = require("mason-null-ls")

mason.setup({
    ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "pyright",
        "html",
        "ts_ls",
        "html"
    }
})

