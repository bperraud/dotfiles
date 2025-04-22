local mason = require("mason-null-ls")

mason.setup({
    ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "pyright",
        "html",
        "ts_ls",
<<<<<<< HEAD
        "html",
        "gopls",
        "vue-language-server"
=======
        "helm_ls"
>>>>>>> b8c5d20be9bc288bc66dbc505a571005bda7a950
    }
})

