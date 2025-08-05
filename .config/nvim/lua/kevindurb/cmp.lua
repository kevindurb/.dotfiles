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
    local col = vim.fn.col('.') - 1
    local line = vim.fn.getline('.')
    local char = line:sub(col, col)

    -- Only trigger if we're not already in completion mode
    if vim.fn.pumvisible() == 0 then
      -- Trigger after typing a word character
      if char:match('%w') and col > 0 then
        local prev_char = line:sub(col - 1, col - 1)
        if prev_char:match('%w') then
          -- We're in the middle of a word, trigger completion
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-o>', true, false, true), 'n', false)
        end
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
