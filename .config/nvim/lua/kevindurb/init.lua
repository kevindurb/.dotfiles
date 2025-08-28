local M = {}

M.setup = function()
  require('kevindurb.colorscheme').setup()
  require('kevindurb.filetype').setup()
  require('kevindurb.keymaps').setup()
  require('kevindurb.general').setup()
  require('kevindurb.ripgrep').setup()
  require('kevindurb.splits').setup()
  -- Uncomment for mini.deps
  require('kevindurb.deps').setup();
  require('kevindurb.format').setup();
  require('kevindurb.lint').setup();
  require('kevindurb.lsp').setup();
  require('kevindurb.treesitter').setup();
  require('kevindurb.mason').setup();
  require('kevindurb.pairs').setup();
  require('kevindurb.pick').setup();
  require('kevindurb.navigator').setup();
  require('kevindurb.oil').setup();
end

return M
