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

set mouse=a                       " Automatically enable mouse usage
set mousehide
syntax on
set nu                            "enable line numbers

" FORMATTING {

  set nowrap                      " Do not wrap long lines
  set autoindent                  " Indent at the same level of the previous line
  set shiftwidth=2                " Use indents of 4 spaces
  set expandtab                   " Tabs are spaces, not tabs
  set tabstop=2                   " An indentation every two columns
  set softtabstop=2               " Let backspace delete indent
  set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
  set splitright                  " Puts new vsplit windows to the right of the current
  set splitbelow                  " Puts new split windows to the bottom of the current
  "set matchpairs+=<:>             " Match, to be used with %
  set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

  "autocmd FileType go autocmd BufWritePre <buffer> Fmt
  autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee

  " Workaround vim-commentary for Haskell
  autocmd FileType haskell setlocal commentstring=--\ %s
  " Workaround broken colour highlighting in Haskell
  autocmd FileType haskell,rust setlocal nospell

" }


" set terminal to 256 colors
set t_Co=256

colorscheme zenburn
