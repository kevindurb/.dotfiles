require('kevindurb.colorscheme')
require('kevindurb.filetype')
require('kevindurb.keymaps')

vim.g.mapleader = ','
vim.opt.encoding = 'utf-8'
vim.opt.title = true                   -- set title in terminal
vim.opt.wildmode = 'longest:list,full' -- make command completion more like zsh
vim.opt.autowrite = true               -- save when you change buffers
vim.opt.clipboard = 'unnamedplus'      -- copy and paste in system clipboard
vim.opt.showtabline = 2                -- always show the tabline
vim.wo.wrap = false                    -- NO WRAPPING LINES
vim.opt.smartindent = true             -- auto indents c-like blocks
vim.opt.shiftround = true              -- round indent to shiftwidth
vim.opt.cursorline = true              -- turn on cursor horizontal line
vim.opt.cursorcolumn = true            -- turn on cursor vertical line
vim.opt.colorcolumn='80'               -- color line at 80 columns
vim.opt.number = true                  -- but still show current line number
vim.opt.relativenumber = true          -- show relative line numbers
vim.opt.showmatch = true               -- highlight matching brace
vim.opt.ignorecase = true              -- ignore search case
vim.opt.smartcase = true               -- dont ignore case once you use a capital
vim.opt.hlsearch = true                -- highlight all search matches
vim.opt.undolevels = 1000              -- holds last 1000 undos
vim.g.backupdir = '~/.vimbackup'       -- backup files in one place
vim.g.directory = '~/.vimbackup'       -- swp files in one place
vim.opt.path = '.,src,**'              -- gf search current, src and recurrsive dir
vim.opt.suffixesadd = '.js,/index.js'  -- gf try adding .js to files
vim.opt.lazyredraw = true              -- dont redraw during macros
vim.opt.regexpengine = 1               -- make syntax faster
vim.g.undodir = '~/.vimundodir'        -- store undo history in a directory
vim.opt.undofile = true                -- so if i close and reopen a file i can still undo
vim.opt.termguicolors = true           -- better colors??
vim.opt.signcolumn = 'yes'             -- always show the gutter
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.mouse = 'a'

-- turn off bells
vim.g.eb = false
vim.g.vb = false
vim.g.t_vb = false

-- if you have rg use rg for vimgrep
vim.cmd([[
  if executable('rg')
    set grepprg=rg\ --vimgrep
  endif

  " Rg command for searching in vim
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!

  " Auto open quickfix after search
  augroup quickfix
      autocmd!
      autocmd QuickFixCmdPost [^l]* cwindow
      autocmd QuickFixCmdPost l* lwindow
  augroup END

  " K keymap for searching word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
]])
