
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy
    },

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- Create an autocmd that formats the buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

--[[
-- Configure null-ls as a diagnostic source
nvim_lsp.diagnosticls.setup({
  on_attach = function(client, bufnr)
    -- Your on_attach function (if any)
  end,
  filetypes = {"python"},
  init_options = {
    linters = {},
    formatFiletypes = {
      python = "black",
    },
  },
})

--]]
