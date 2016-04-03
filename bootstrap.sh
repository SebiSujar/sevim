#!/bin/bash

function die()
{
  echo "${@}"
  exit 1
}

vim_dir="$HOME/.vim"

git clone --recursive https://github.com/SebiSujar/myvim $vim_dir \
  || die "Could not clone the repository to ${HOME}/.vim"

ln -s $vim_dir $HOME/.vimrc \
  || die "Could not clone the repository to ${HOME}/.vim"
