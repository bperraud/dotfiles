-- Setup devicons (optional)
require('nvim-web-devicons').setup {
  default = true, -- Ensures that default icons are used
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "html", "javascript", "typescript", "json", "bash", "yaml", "c", "vim", "cpp", "dockerfile", "go", "helm", "htmldjango", "nginx", "php", "rust"},
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
