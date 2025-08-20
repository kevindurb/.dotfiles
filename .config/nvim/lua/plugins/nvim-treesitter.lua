return {
  'nvim-treesitter/nvim-treesitter', -- the base for all things better
  build = ':TSUpdate',
  branch = 'master',
  lazy = false,
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
      'prisma',
      'query',
      'regex',
      'styled',
      'typescript',
      'vim',
      'vimdoc',
    },
    sync_install = false,
    auto_install = true,

    highlight = { enable = true },
  },
}
