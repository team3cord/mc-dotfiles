set nocompatible              " be iMproved, required
filetype off                  " required

set guifont=Monaco:h19
set spell spell spelllang=en_us 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" github repo  


Plugin 'tpope/vim-fugitive'
" plugin https://github.com/jelera/vim-javascript-syntax
Plugin 'jelera/vim-javascript-syntax'
" plugin from GitHub repo  

Plugin 'syntastic'  
" plugin colorscheme  
Plugin 'quanganhdo/grb256' 
" plugin from GitHub repo  
Plugin 'nerdtree'
" plugin from GitHub repo  
Plugin 'snipmate'

" plugin vim-javascript from GitHub  
Plugin 'pangloss/vim-javascript'  

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set nocompatible
syntax enable
" set foldmethod=syntax
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

" autocmd vimenter * NERDTree 
" autocmd vimenter * wincmd p
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
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

" colo Tomorrow-Night-Bright
:set t_Co=256  
:set background=dark  
:colorscheme grb256   
let NERDTreeShowHidden=1
" Custom macros  
" let @fn='ifunction(){}<Esc>hhhi'
" let @cl='console.log();^[hi^[\'

" let @cl = 'iconsole.log();'
