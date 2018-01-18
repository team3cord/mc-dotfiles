set nocompatible              " be iMproved, required
filetype off                  " required

set guifont=Monaco:h17
set spell spell spelllang=en_us 

" Vim Plug plugin mngr  
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
call plug#end()
" Vim Plug plugin mngr  
syntax on
set nocompatible
syntax enable
" set foldmethod=syntax
set fileencoding=utf-8
set encoding=utf-8
" TABs are evils  
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set shiftround  
set expandtab
" TABs are evils
set scrolloff=6  
" set autoindent
set backspace=indent,eol,start
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set nolist
set number
set noswapfile
set visualbell
set cursorline

" autocmd vimenter * NERDTree 
" autocmd vimenter * wincmd p
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS  
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
  if winnr("$") == 1
    q
  endif
endif
enddif
endfunction

" colo Tomorrow-Night-Bright
:set t_Co=256  
:set background=dark  
:colorscheme grb256   
NERDTreeShowHidden=1
" Custom macros  
