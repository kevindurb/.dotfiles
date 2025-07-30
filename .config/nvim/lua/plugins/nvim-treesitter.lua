return {
  'nvim-treesitter/nvim-treesitter', -- the base for all things better
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'gotmpl',
      'http',
      'hurl',
      'javascript',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'query',
      'regex',
      'styled',
      'typescript',
      'vim',
      'vimdoc',
    },
    sync_install = false,
    auto_install = true,

    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  },
}
