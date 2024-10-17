
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy
    },

    on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
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
