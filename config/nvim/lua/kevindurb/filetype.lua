vim.cmd([[
  " set markdown to 80 characters wide
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " spelling in markdown and commit messages
  autocmd FileType markdown setlocal spell
  autocmd FileType gitcommit setlocal spell

  " folding xml files
  augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent
  augroup END

  " folding json files
  augroup JSON
    autocmd!
    autocmd FileType json setlocal foldmethod=syntax
  augroup END

  " add syntax for rollback
  augroup rollback
    autocmd!
    autocmd BufNewFile,BufRead *.rollback set syntax=sql
  augroup END

  " add syntax for dbt
  augroup dbt
    autocmd!
    autocmd BufNewFile,BufRead *.sql set ft=jinja.sql
  augroup END

  " add syntax for babelrc
  augroup babelrc
    autocmd!
    autocmd BufNewFile,BufRead .babelrc set syntax=json
  augroup END

  augroup jenkinsfile
    autocmd!
    autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
  augroup END

  augroup language_tabbing
    autocmd!
    autocmd Filetype php        setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype css        setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype lua        setlocal ts=2 sts=2 sw=2 expandtab
  augroup END
]])
