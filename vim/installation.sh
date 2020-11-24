#!/bin/bash -e

function main() {
    install_vim_config
}

function install_vim_config() {
    local vundle_dir=~/.vim/bundle/Vundle.vim
    if [[ ! -d $vundle_dir ]];
    then
        git clone https://github.com/VundleVim/Vundle.vim $vundle_dir
    fi

    cp ./vimrc ~/.vimrc

    vim +PluginInstall! +qall
}

main
