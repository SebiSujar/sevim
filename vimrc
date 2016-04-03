set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ","

"-----------VUNDLE CONFIG--------------"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/plugins.vim
call vundle#end()            " required
filetype plugin indent on    " required
"--------------------------------------"

" Put your non-Plugin stuff after this line

" Formatting {


  " Workaround vim-commentary for Haskell
  autocmd FileType haskell setlocal commentstring=--\ %s
  " Workaround broken colour highlighting in Haskell
  autocmd FileType haskell,rust setlocal nospell
" }


syntax on

set nu "enable line numbers

"set indent to 2 spaces by default
:set tabstop=2 shiftwidth=2 expandtab


" set terminal to 256 colors
set t_Co=256

colorscheme zenburn
