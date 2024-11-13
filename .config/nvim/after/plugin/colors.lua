--function ColorPencils(color)
--	color = color or "rose-pine"
--	vim.cmd.colorscheme(color)

--	vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
--end

--require('rose-pine').setup({ disable_italics = true, })

--ColorPencils()
--
--

require('vscode').setup({
    -- transparent = true,
    disable_nvimtree_bg = true,
})
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#282828' })

vim.cmd.colorscheme "vscode"
