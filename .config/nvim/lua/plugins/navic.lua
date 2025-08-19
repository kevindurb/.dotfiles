return {
  'SmiteshP/nvim-navic',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  opts = {
    lsp = {
      auto_attach = true,
      preference = { 'ts_ls', 'graphql' },
    }
  }
}
