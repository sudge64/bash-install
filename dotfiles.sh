#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":u:" option; do
    case $option in
        u) user_name=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

echo "Non sudo user name : $user_name"

if [ ! $(ls /home/$user_name/.local/share/fonts) ]
then
    echo "Make /home/$user_name/.local/share/fonts"
    mkdir /home/$user_name/.local/share/fonts
fi

if [ ! $(ls /home/$user_name/.local/share/fonts/Meslo*) ]
then
    echo "Download Meslo Nerd Font"
    wget -P /home/$user_name/.local/share/fonts/ "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
    echo "Unzip Meslo Nerd Font"
    unzip /home/$user_name/.local/share/fonts/Meslo.zip -d /home/$user_name/.local/share/fonts/
    rm /home/$user_name/.local/share/fonts/Meslo.zip
fi

if [ ! $(ls /home/$user_name/.config/nvim) ]
then
    echo "Copy init.lua."
    mkdir /home/$user_name/.config/nvim
    cp ./files/init.lua /home/$user_name/.config/nvim/
fi

if [ ! $(ls /home/$user_name/.config/kitty) ]
then
    echo "Copy kitty.conf."
    mkdir /home/$user_name/.config/kitty
    cp ./files/kitty.conf /home/$user_name/.config/kitty/
fi

if [ ! $(ls /home/$user_name/.config/MangoHud) ]
then
    echo "Copy MangoHud.conf."
    mkdir /home/$user_name/.config/MangoHud
    cp ./files/MangoHud.conf /home/$user_name/.config/MangoHud/
fi

if [ ! $(ls /home/$user_name/.p10k.zsh) ]
then
    echo "Copy .p10k.zsh."
    cp ./files/.p10k.zsh /home/$user_name/
fi

if [ ! $(ls /home/$user_name/.zshrc) ]
then
    echo "Copy .zshrc."
    cp ./files/.zshrc /home/$user_name/
fi

