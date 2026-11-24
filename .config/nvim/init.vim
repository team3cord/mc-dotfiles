" ~/.config/nvim/init.vim

set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Load your existing config
source ~/.vim/.vimrc
