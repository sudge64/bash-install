#!/bin/bash

# Authored by C.J. Wade
# 09/01/23
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

if [ ! -d "/home/$user_name/.local/share/fonts" ]
then
    echo "Make /home/$user_name/.local/share/fonts"
    sudo -u "$user_name" mkdir /home/"$user_name"/.local/share/fonts
fi

if [ ! -f "/home/$user_name/.local/share/fonts/Meslo*" ]
then
    echo "Download Meslo Nerd Font"
    sudo -u "$user_name" wget -P /home/"$user_name"/.local/share/fonts/ "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.tar.xz"
    echo "Unzip Meslo Nerd Font"
    sudo -u "$user_name" tar -xvf /home/"$user_name"/.local/share/fonts/Meslo.tar.xz -C /home/"$user_name"/.local/share/fonts/
    sudo -u "$user_name" rm /home/"$user_name"/.local/share/fonts/Meslo.tar.xz
fi

if [ ! -f "/home/$user_name/.p10k.zsh" ]
then
    echo "Copy .p10k.zsh."
    sudo -u "$user_name" cp ./files/.p10k.zsh /home/"$user_name"/
fi

if [ ! -f "/home/$user_name/.zshrc" ]
then
    echo "Copy .zshrc."
    sudo -u "$user_name" cp ./files/.zshrc /home/"$user_name"/
fi
