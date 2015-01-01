execute pathogen#infect()
execute pathogen#helptags()
set guifont=Monaco:h18
" colo Tomorrow-Night-Bright
:set t_Co=256  
:set background=dark  
:colorscheme grb256  
syntax on

set nocompatible

filetype on
filetype indent on
filetype plugin on

syntax enable
"set foldmethod=syntax
set ignorecase
set scrolloff=6  

set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab

set smartcase
set gdefault
set incsearch
set showmatch

set nolist
set number
set noswapfile
set visualbell
set cursorline

"autocmd vimenter * NERDTree 
"autocmd vimenter * wincmd p

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
