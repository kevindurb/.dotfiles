local M = {}

M.setup = function()
  require('kevindurb.colorscheme').setup()
  require('kevindurb.filetype').setup()
  require('kevindurb.keymaps').setup()
  require('kevindurb.general').setup()
  require('kevindurb.ripgrep').setup()
  require('kevindurb.splits').setup()
  require('kevindurb.cmp').setup()
end

return M
