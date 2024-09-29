-- Define the Mason configuration
local mason = require("mason-null-ls")

mason.setup({
    ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright"
    }
})

