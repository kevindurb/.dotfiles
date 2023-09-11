return {
  'Raimondi/delimitMate', -- auto close everything else
  init = function()
    vim.g.delimitMate_matchpairs = '(:),[:],{:}'
  end,
}
