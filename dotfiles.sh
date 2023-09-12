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

if [ ! -f /home/$user_name/.config/nvim/init.lua ]
then
    echo "Copy init.lua."
    sudo -u $user_name mkdir /home/$user_name/.config/nvim
    sudo -u $user_name cp ./files/init.lua /home/$user_name/.config/nvim/
    sudo -u $user_name cp ./files/lazy-lock.json /home/$user_name/.config/nvim/
fi

if [ ! -f /home/$user_name/.config/kitty/kitty.conf ]
then
    echo "Copy kitty.conf."
    sudo -u $user_name mkdir /home/$user_name/.config/kitty
    sudo -u $user_name cp ./files/kitty.conf /home/$user_name/.config/kitty/
fi

if [ ! -f /home/$user_name/.config/MangoHud/MangoHud.conf ]
then
    echo "Copy MangoHud.conf."
    sudo -u $user_name mkdir /home/$user_name/.config/MangoHud
    sudo -u $user_name cp ./files/MangoHud.conf /home/$user_name/.config/MangoHud/
fi

