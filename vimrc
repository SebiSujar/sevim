set nocompatible              " be iMproved, required
filetype off                  " required

if $SHELL =~ 'bin/fish'
  set shell=/bin/bash
endif

"-----------VUNDLE CONFIG--------------"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/plugins.vim
call vundle#end()            " required
filetype plugin indent on    " required
"--------------------------------------"

" Put your non-Plugin stuff after this line

" GENERAL CONFIG {
  set backspace=indent,eol,start  " regular backspace (could be improved)
  set mouse=a                     " Automatically enable mouse usage
  set mousehide
  syntax on
  set incsearch                   " Find as you type search
  set hlsearch                    " Highlight search terms
  set number                      " enable line numbers
  set t_Co=256                    " set terminal to 256 colors
  set showcmd                     " show partial commands
  set wildmenu                    " show autocomplete list
  colorscheme zenburn
" }

" FORMATTING {

  set nowrap                      " Do not wrap long lines
  set autoindent                  " Indent at the same level of the previous line
  set shiftwidth=2                " Use indents of 2 spaces
  set tabstop=2                   " An indentation every two columns
  set softtabstop=2               " Let backspace delete indent
  set expandtab                   " Tabs are spaces, not tabs
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

" MAPPINGS {

  let mapleader = ","
  let g:mapleader = ","

  " shift key fixes
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>

    cmap Tabe tabe
" }

" PLUGINS {
  " ctrlP {
     let g:ctrlp_map = '<c-p>'
     let g:ctrlp_cmd = 'CtrlP'

     let g:ctrlp_working_path_mode = 'ra'
  " }

  " airline {
      set laststatus=2
  " }

  " nerdtree {
    map <leader>n :NERDTreeToggle<CR>

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " }
  "
  " HARDMODE {
  "    let g:HardMode_level = 'wannabe'
  "    autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
  "    nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
  " }
" }
