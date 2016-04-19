#!/bin/bash

function die()
{
  echo "${@}"
  exit 1
}

echo "Welcome to..."
cat << "EOF"
 ______     ______     __   __   __     __    __    
/\  ___\   /\  ___\   /\ \ / /  /\ \   /\ "-./  \   
\ \___  \  \ \  __\   \ \ \'/   \ \ \  \ \ \-./\ \  
 \/\_____\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\ 
  \/_____/   \/_____/   \/_/      \/_/   \/_/  \/_/ 
                                                    
EOF
echo

vim_dir="$HOME/.vim"

git clone --recursive https://github.com/SebiSujar/sevim $vim_dir \
  || die "Could not clone the repository to ${HOME}/.vim"

bundle_dir="$vim_dir/bundle"
mkdir $bundle_dir

git clone https://github.com/VundleVim/Vundle.vim.git $bundle_dir/Vundle.vim \
  || die "Could not clone Vundle in ${vim_dir}/bundle"

ln -s $vim_dir/vimrc $HOME/.vimrc \
  || die "Could not create symbolic link in ${HOME}"

echo "installing plugins, this may take a while"

echo | echo | vim +PluginInstall +qall &>/dev/null &
pid=$!

#spinner
spin='-\|/'

i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done

printf "\rDone!\nTime to vim hell out of sevim!\n"
