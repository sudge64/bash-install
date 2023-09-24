#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":c:" option; do
    case $option in
        c) choice=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

function server_install(){
        echo "Install cli packages."
        apt install $(cat packages/apt_cli.txt) -y

        echo "Install dependencies for Neovim."
        apt install python3.10-venv ninja-build gettext libtool libtool-bin cmake g++ pkg-config unzip curl doxygen -y

        echo "Install Neovim from Github."
        git clone https://github.com/neovim/neovim
}

if [ $choice -eq 1 ]
then
    server_install
elif [ $choice -eq 2 ]
then 
    server_install
    echo "Install graphical packages."
    apt install $(cat packages/apt_graphical.txt) -y
    echo "Install pipx"
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
else
    echo "invalid choice?"
fi
