set nocompatible              " be iMproved, required
filetype off                  " required

set guifont=Monaco:h17
set spell spell spelllang=en_us 

" Vim Plug plugin mngr  
call plug#begin('~/.vim/plugged')
    "Plug 'scrooloose/nerdtree'
    "   Plug 'scrooloose/syntastic'
    "   Plug 'quanganhdo/grb256'
    " Override configs by directory 
    Plug 'arielrossanigo/dir-configs-override.vim'
    " Better file browser
    Plug 'scrooloose/nerdtree'
    " Code commenter
    Plug 'scrooloose/nerdcommenter'
    " Class/module browser
    Plug 'majutsushi/tagbar'
    " Code and files fuzzy finder
    Plug 'ctrlpvim/ctrlp.vim'
    " Extension to ctrlp, for fuzzy command finder
    Plug 'fisadev/vim-ctrlp-cmdpalette'
    " Zen coding
    Plug 'mattn/emmet-vim'
    " Git integration
    Plug 'motemen/git-vim'
    " Tab list panel
    Plug 'kien/tabman.vim'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Terminal Vim with 256 colors colorscheme
    Plug 'fisadev/fisa-vim-colorscheme'
    " Consoles as buffers
    Plug 'rosenfeld/conque-term'
    " Pending tasks list
    Plug 'fisadev/FixedTaskList.vim'
    " Surround
    Plug 'tpope/vim-surround'
    " Autoclose
    Plug 'Townk/vim-autoclose'
    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'
    " Indentation based movements
    Plug 'jeetsukumaran/vim-indentwise'
    " Python autocompletion, go to definition.
    Plug 'davidhalter/jedi-vim'
    " Better autocompletion
    Plug 'Shougo/neocomplcache.vim'
    " Snippets manager (SnipMate), dependencies, and snippets repo
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    Plug 'honza/vim-snippets'
    Plug 'garbas/vim-snipmate'
    " Git/mercurial/others diff icons on the side of the file lines
    Plug 'mhinz/vim-signify'
    " Automatically sort python imports
    Plug 'fisadev/vim-isort'
    " Drag visual blocks arround
    Plug 'fisadev/dragvisuals.vim'
    " Window chooser
    Plug 't9md/vim-choosewin'
    " Python and other languages code checker
    Plug 'scrooloose/syntastic'
    " Paint css colors with the real color
    Plug 'lilydjwg/colorizer'
    " Ack code search (requires ack installed in the system)
    Plug 'mileszs/ack.vim'
    if has('python')
        " YAPF formatter for Python
        Plug 'pignacio/vim-yapf-format'
    endif
    " Relative numbering of lines (0 is the current line)
    " (disabled by default because is very intrusive and can't be easily toggled
    " on/off. When the plugin is present, will always activate the relative 
    " numbering every time you go to normal mode. Author refuses to add a setting 
    " to avoid that)
    " Plug 'myusuf3/numbers.vim'

    " Plugins from vim-scripts repos:

    " Search results counter
    Plug 'vim-scripts/IndexedSearch'
    " XML/HTML tags navigation
    Plug 'vim-scripts/matchit.zip'
    " Gvim colorscheme
    Plug 'vim-scripts/Wombat'
    " Yank history navigation
    Plug 'vim-scripts/YankRing.vim'
call plug#end()
" Vim Plug plugin mngr  
syntax on
set nocompatible
syntax enable

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" set foldmethod=syntax
set fileencoding=utf-8
set encoding=utf-8
" TABs are evils  
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set shiftround  
set expandtab
" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
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
" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch

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
":set t_Co=256  
":set background=dark  
":colorscheme grb256   
let NERDTreeShowHidden=1
" Custom macros  
" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar ----------------------------- 

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree ----------------------------- 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" CtrlP ------------------------------

" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_style_error_symbol = '✗'
"let g:syntastic_style_warning_symbol = '⚠'

" Jedi-vim ------------------------------

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplCache ------------------------------

" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡':1
"
