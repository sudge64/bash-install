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
    echo "Set up neovim"
    sudo -u $user_name mkdir /home/$user_name/.config/nvim
    sudo -u $user_name cp ./files/init.lua /home/$user_name/.config/nvim/
    sudo -u $user_name cp ./files/lazy-lock.json /home/$user_name/.config/nvim/
fi

if [ ! -f /home/$user_name/.config/tmux/tmux.conf ]
then
    echo "Set up tmux"
    sudo -u $user_name mkdir /home/$user_name/.config/tmux
    sudo -u $user_name cp ./files/tmux.conf /home/$user_name/.config/tmux/
    git clone https://github.com/tmux-plugins/tpm /home/$user_name/.config/tmux/plugins/tpm
fi

if [ ! -f /home/$user_name/.config/kitty/kitty.conf ]
then
    echo "Set up kitty"
    sudo -u $user_name mkdir /home/$user_name/.config/kitty
    sudo -u $user_name cp ./files/kitty.conf /home/$user_name/.config/kitty/
fi

if [ ! -f /home/$user_name/.config/alacritty/alacritty.toml ]
then
    echo "Set up alacritty"
    sudo -u $user_name mkdir /home/$user_name/.config/alacritty
    curl -LO --output-dir /home/$user_name/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml
    sudo -u $user_name cp ./files/alacritty.toml /home/$user_name/.config/alacritty/
fi


if [ ! -f /home/$user_name/.config/MangoHud/MangoHud.conf ]
then
    echo "Set up MangoHud"
    sudo -u $user_name mkdir /home/$user_name/.config/MangoHud
    sudo -u $user_name cp ./files/MangoHud.conf /home/$user_name/.config/MangoHud/
fi

if [ ! -f /home/$user_name/.config/rofi/config.rasi ]
then
    echo "Set up rofi"
    git clone https://github.com/catppuccin/rofi ../rofi
    cd ../rofi/basic
    ./install.sh
    cd ../../bash-install
    sudo -u $user_name cp ./files/config.rasi /home/$user_name/.config/rofi/
fi

if [ ! -d /home/$user_name/.config/waybar/ ]
then
    echo "Set up waybar"
    sudo -u $user_name mkdir /home/$user_name/.config/waybar
    sudo -u $user_name cp -r ./files/waybar/* /home/$user_name/.config/waybar/
fi

if [ ! -d /home/$user_name/.config/wlogout/ ]
then
    echo "Set up wlogout"
    sudo -u $user_name mkdir /home/$user_name/.config/wlogout
    sudo -u $user_name cp -r ./files/wlogout/* /home/$user_name/.config/wlogout/
fi

if [ ! -d /home/$user_name/.config/hypr/ ]
then
    echo "Set up hyprland"
    sudo -u $user_name mkdir /home/$user_name/.config/hypr
    sudo -u $user_name cp -rv ./files/hypr/*.conf /home/$user_name/.config/hypr/
fi

if [ ! -f /home/$user_name/.config/pipewire/pipewire.conf.d/10-focusrite-channels.conf ]
then
    echo "Set up neovim"
    sudo -u $user_name mkdir -p /home/$user_name/.config/pipewire/pipewire.conf.d
    sudo -u $user_name cp ./files/10-focusrite-channels.conf /home/$user_name/.config/pipewire/pipewire.conf.d
fi
