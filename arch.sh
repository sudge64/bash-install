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
    pacman -S $(cat packages/pacman_cli.txt) -y

    echo "Install dependencies for Neovim."
    pacman -S base-devel cmake unzip ninja curl -y
}

if [ $choice -eq 1 ]
then
    server_install
elif [ $choice -eq 2 ]
then 
    server_install
    echo "Install graphical packages."
    pacman -S $(cat packages/pacman_graphical.txt)
else
    echo "invalid choice?"
fi
