#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

while getopts ":c:h:u:" option; do
    case $option in
        c) choice=$OPTARG;;
        h) choice_hyprland=$OPTARG;;
        u) user_name=$OPTARG;;
        *) echo "Invalid Option"
            exit;;
    esac
done

function server_install(){
    echo "Install cli packages."
    pacman -S $(cat packages/pacman_cli.txt) --noconfirm

    echo "Install dependencies for Neovim."
    pacman -S base-devel cmake unzip ninja curl --noconfirm

    pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs

    echo 'unix_sock_group = "libvirt"' >> /etc/libvirt/libvirtd.conf
    echo 'unix_sock_rw_perms = "0770"' >> /etc/libvirt/libvirtd.conf

    usermod -a -G libvirt input $user_name
    newgrp libvirt

    echo "Remember! sudo systemctl start libvirtd.service"
}

if [ "$choice" -eq 1 ]
then
    server_install
    echo "Install graphical packages."
    pacman -S $(cat packages/pacman_graphical.txt) --noconfirm
elif [ "$choice" -eq 2 ]
then 
    server_install
else
    echo "invalid choice?"
fi

if [ "$choice_hyprland" -eq 1 ]
then
    echo "Installing Hyprland"
    pacman -S $(cat packages/hyprland.txt) --noconfirm
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    echo "Moving hyprland conf files"
    sudo -u $user_name cp -ruv ./files/hypr/ /home/$user_name/.config/
    echo "Installing Paru"
    git clone https://aur.archlinux.org/paru.git ../paru
    cd ../paru
    makepkg -si
    cd ../bash-install
    paru -S $(cat packages/paru.txt)
    source ./catppuccin.sh
else
    echo "Not Installing Hyprland"
fi
pacman -S $(cat packages/pacman_framework.txt) --noconfirm

if [ ! -f /etc/modprobe.d/hid_apple.conf ]
then
    echo "Move hid_apple.conf"
    cp ./files/hid_apple.conf /etc/modprobe.d/
fi

if [ ! -f /etc/modprobe.d/vfio.conf ]
then
    echo "Move vfio.conf"
    cp ./files/vfio.conf /etc/modprobe.d/
fi

if [ ! -f /etc/modules-load.d/v4l2loopback.conf ]
then
    echo "Move v4l2loopback.conf"
    cp ./files/v4l2loopback.conf /etc/modules-load.d/
fi
