local M = {}

M.setup = function()
  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd

  -- Spelling in markdown and commit messages
  autocmd('FileType', {
    pattern = { 'markdown', 'gitcommit' },
    callback = function()
      vim.opt_local.spell = true
    end,
    desc = 'Enable spell checking for markdown and git commit messages'
  })

  -- Word wrap for markdown
  autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
      vim.opt_local.wrap = true
    end,
    desc = 'Enable word wrap for markdown files'
  })

  -- Folding XML files
  local xml_group = augroup('XML', { clear = true })
  autocmd('FileType', {
    group = xml_group,
    pattern = 'xml',
    callback = function()
      vim.opt_local.foldmethod = 'indent'
    end,
    desc = 'Set indent folding for XML files'
  })

  -- Folding JSON files
  local json_group = augroup('JSON', { clear = true })
  autocmd('FileType', {
    group = json_group,
    pattern = 'json',
    callback = function()
      vim.opt_local.foldmethod = 'syntax'
    end,
    desc = 'Set syntax folding for JSON files'
  })

  -- Add syntax for rollback files
  local rollback_group = augroup('rollback', { clear = true })
  autocmd({ 'BufNewFile', 'BufRead' }, {
    group = rollback_group,
    pattern = '*.rollback',
    callback = function()
      vim.bo.syntax = 'sql'
    end,
    desc = 'Set SQL syntax for rollback files'
  })

  -- Add syntax for dbt files
  local dbt_group = augroup('dbt', { clear = true })
  autocmd({ 'BufNewFile', 'BufRead' }, {
    group = dbt_group,
    pattern = '*.sql',
    callback = function()
      vim.bo.filetype = 'jinja.sql'
    end,
    desc = 'Set jinja.sql filetype for SQL files (dbt)'
  })

  -- Add syntax for babelrc files
  local babelrc_group = augroup('babelrc', { clear = true })
  autocmd({ 'BufNewFile', 'BufRead' }, {
    group = babelrc_group,
    pattern = '.babelrc',
    callback = function()
      vim.bo.syntax = 'json'
    end,
    desc = 'Set JSON syntax for .babelrc files'
  })

  -- Jenkinsfile syntax
  local jenkinsfile_group = augroup('jenkinsfile', { clear = true })
  autocmd({ 'BufRead', 'BufNewFile' }, {
    group = jenkinsfile_group,
    pattern = 'Jenkinsfile',
    callback = function()
      vim.bo.filetype = 'groovy'
    end,
    desc = 'Set groovy filetype for Jenkinsfile'
  })
end

return M
