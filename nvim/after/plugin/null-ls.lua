

--[[
local null_ls = require('null-ls')
local opts = {
    source = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
    }
}
return opts
--]]
--
--
--[[
local null_ls = require('null-ls')

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.diagnostics.ruff,
  }
}
--]]

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
    },
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
