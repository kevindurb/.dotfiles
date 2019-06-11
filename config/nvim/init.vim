" vim: set fdm=marker expandtab ts=2 sw=2:
"  _  __          _         ____             _     _
" | |/ /_____   _(_)_ __   |  _ \ _   _ _ __| |__ (_)_ __
" | ' // _ \ \ / / | '_ \  | | | | | | | '__| '_ \| | '_ \
" | . \  __/\ V /| | | | | | |_| | |_| | |  | |_) | | | | |
" |_|\_\___| \_/ |_|_| |_| |____/ \__,_|_|  |_.__/|_|_| |_|
"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" {{{ Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'               " a good place to start
Plug 'tomasiser/vim-code-dark'       " theme

Plug 'kevindurb/vim-splits'             " split settings and keymaps
Plug 'kevindurb/vim-whiteout'           " show trailing whitespace

Plug 'vim-airline/vim-airline'          " statusline
Plug 'vim-airline/vim-airline-themes'   " statusline themes

Plug 'tpope/vim-commentary'             " sweet commenting
Plug 'tpope/vim-fugitive'               " git commands in vim
Plug 'tpope/vim-repeat'                 " repeating plugin commands
Plug 'tpope/vim-surround'               " surround with things
Plug 'tpope/vim-unimpaired'             " mappings for things with '['
Plug 'tpope/vim-vinegar'                " browse directories with -
Plug 'tpope/vim-dispatch'               " add backgrounding

Plug 'cespare/vim-toml'                 " rust config files
Plug 'rust-lang/rust.vim'               " rust syntax
Plug 'pangloss/vim-javascript'          " js syntax
Plug 'MaxMEllon/vim-jsx-pretty'         " jsx syntax
Plug 'leafgarland/typescript-vim'       " typescript syntax

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'alvan/vim-closetag'               " autoclose tags
Plug 'Raimondi/delimitMate'             " auto close everything else
Plug 'christoomey/vim-tmux-navigator'   " navigate panes in tmux && vim
Plug 'w0rp/ale'                         " syntax and style checking
Plug 'vim-vdebug/vdebug'                " debug php
Plug 'ludovicchabant/vim-gutentags'     " auto tag file management

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
" }}}

" {{{ Plugin Settings
" statusline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark'

" ale settings
let g:ale_linters = {
\ 'graphql': ['gqlint'],
\ 'javascript': ['eslint'],
\ 'javascript jsx': ['eslint'],
\ 'css': ['stylelint'],
\ 'ruby': [],
\}
let g:ale_php_phpcs_standard = '/Users/kdurbin/Development/churchcommunitybuilder/app/src/phpcs_ruleset.xml'
let g:ale_php_phpcs_executable = '/Users/kdurbin/Development/churchcommunitybuilder/app/vendor/bin/phpcs'
let g:ale_php_phpcs_use_global = 0

" vdebug
let g:vdebug_options = {
\   'path_maps': {
\     '/var/www/app': '/Users/kdurbin/Development/churchcommunitybuilder/app',
\     '/var/www/am': '/Users/kdurbin/Development/churchcommunitybuilder/am',
\     '/var/www/intranet-api': '/Users/kdurbin/Development/intranet-api/app',
\   },
\   'port': 9000,
\   'server': '',
\   'timeout': 20,
\   'ide_key': 'XDEBUG_ECLIPSE',
\   'break_on_open': 0,
\   'continuous_mode': 1,
\   'debug_file': '~/vdebug.log',
\   'debug_file_level': 2,
\   'watch_window_style': 'compact',
\ }
let g:vdebug_features = {
\   'max_children': 2048,
\ }

" match pairs
let delimitMate_matchpairs = "(:),[:],{:}"

" autoclose jsx
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"

" }}}

" {{{ Base Editor Config
set encoding=utf-8
set title                       " set title in terminal
set wildmode=longest:list,full  " make command completion more like zsh
set autowrite                   " save when you change buffers
set clipboard=unnamed           " copy and paste in system clipboard
set showtabline=2               " always show the tabline
set nowrap                      " NO WRAPPING LINES
set smartindent                 " auto indents c-like blocks
set shiftround                  " round indent to shiftwidth
set cursorline                  " turn on cursor horizontal line
set colorcolumn=80              " color line at 80 columns
set number                      " but still show current line number
set relativenumber              " show relative line numbers
set showmatch                   " highlight matching brace
set ignorecase                  " ignore search case
set smartcase                   " dont ignore case once you use a capital
set hlsearch                    " highlight all search matches
set undolevels=1000             " holds last 1000 undos
set backupdir=$HOME/.vimbackup  " backup files in one place
set directory=$HOME/.vimbackup  " swp files in one place
set path=.,src,**               " gf search current, src and recurrsive dir
set suffixesadd=.js,/index.js   " gf try adding .js to files
set lazyredraw                  " dont redraw during macros
set regexpengine=1              " make syntax faster
set noeb vb t_vb=               " turn off the most annoying thing ever
set undodir=$HOME/.vimundodir   " store undo history in a directory
set undofile                    " so if i close and reopen a file i can still undo
set termguicolors               " better colors??
set signcolumn=yes              " always show the gutter
" set mouse=a                     " enable the mouse :shrug:
" }}}

" {{{ Colorscheme
set background=dark
colorscheme codedark

set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
" }}}

" {{{ Custom Commands
command! MakeTags !ctags -R .
" }}}

" {{{ Searching
" if you have rg use rg for vimgrep and ctrlp
if executable('rg')
  " use rg instead of grep
  set grepprg=rg\ --vimgrep
endif

" Rg command for searching in vim
command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!

" K keymap for searching word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" {{{ File Type Settings
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

" add syntax for rollback
augroup rollback
  autocmd!
  autocmd BufNewFile,BufRead *.rollback set syntax=sql
augroup END

" add syntax for babelrc
augroup rollback
  autocmd!
  autocmd BufNewFile,BufRead .babelrc set syntax=json
augroup END
" }}}

" {{{ Indent Settings
set tabstop=2                   " columns per tab
set shiftwidth=2                " spaces per indent
set softtabstop=2               " spaces per tab
set expandtab                   " use soft tabs
set smartindent                 " auto indents c-like blocks
set shiftround                  " round indent to shiftwidth

augroup language_tabbing
  autocmd!
  autocmd Filetype php        setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype css        setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
augroup END
" }}}

" {{{ Keymaps
" remap leader
let mapleader=','

" reload vimrc
nnoremap <leader>r :so $HOME/.vim/vimrc<CR>

" fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-o> :BTags<CR>
nnoremap <leader>b :Buffers<CR>

" fing docker
nnoremap <leader>w :w!<CR>

" saner searching directions
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
" }}}

" {{{ Autocomplete
" set complete+=kspell            " add dictionary to completion
" set completeopt=longest,menuone " dont select first, insert longest common text

" preselect first item in menu
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" }}}
