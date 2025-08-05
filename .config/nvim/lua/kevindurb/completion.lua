local M = {}

M.setup = function()
  -- Enable built-in completion
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'preview' }
  vim.opt.omnifunc = 'syntaxcomplete#Complete'

  -- Enable spell checking (for spell completions)
  vim.opt.spell = true
  vim.opt.spelllang = 'en_us'

  -- Enhanced buffer completion
  vim.opt.complete = 'kspell,.,w,b,u,t' -- Current buffer, windows, other buffers, unloaded buffers, tags

  -- Enhanced file path completion
  vim.opt.wildmenu = true
  vim.opt.wildmode = 'longest:full,full'

  -- Auto-trigger completion after typing characters
  local function auto_complete()
    if vim.fn.pumvisible() == 0 then
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]

      -- Trigger as long as there's any non-whitespace character before cursor
      if col > 0 and line:sub(col, col):match('%S') then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-o>', true, false, true), 'n', false)
      end
    end
  end

  -- Set up autocommand for automatic completion
  vim.api.nvim_create_autocmd({ 'TextChangedI', 'TextChangedP' }, {
    callback = function()
      vim.defer_fn(auto_complete, 100) -- Small delay to avoid too frequent triggers
    end
  })

  vim.keymap.set('i', '<C-Space>', function()
    if vim.fn.pumvisible() == 1 then
      -- If completion menu is visible, confirm the selection
      return '<C-y>'
    else
      -- If no menu visible, trigger completion
      return '<C-x><C-o>'
    end
  end, { expr = true, silent = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local bufnr = args.buf
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
  })
end

return M
