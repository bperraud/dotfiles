-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --- vim Helm detection 
    use {
        'towolf/vim-helm'
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    ---- colorscheme
    use('Mofiqul/vscode.nvim')
    ---- use { "catppuccin/nvim", as = "catppuccin" }
    ---- theme
    ----use({
    ----'rose-pine/neovim',
    ----as = 'rose-pine',
    ----config = function()
    ----vim.cmd('colorscheme rose-pine')
    ----end
    ----}

    ---- -- comment
    use('tpope/vim-commentary')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'rafamadriz/friendly-snippets'          -- Collection of snippets
    use 'mattn/emmet-vim'

    -- LSP and tools
    use 'neovim/nvim-lspconfig'
    use { 'williamboman/mason.nvim', run = ":MasonUpdate" }
    use 'williamboman/mason-lspconfig.nvim'

    -- Completion engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.4.0",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })    

    -- Debugger
    use { 'mfussenegger/nvim-dap' }
    use { "jay-babu/mason-nvim-dap.nvim" }
    use { "rcarriga/nvim-dap-ui" }
    use { "nvim-neotest/nvim-nio" }

    -- Markdown
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({})
        end,
    })

end)
