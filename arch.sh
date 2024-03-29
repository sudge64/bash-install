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

    usermod -a -G libvirt $user_name
    newgrp libvirt

    echo "Remember! sudo systemctl start libvirtd.service"
}

if [ $choice -eq 1 ]
then
    server_install
elif [ $choice -eq 2 ]
then 
    server_install
    echo "Install graphical packages."
    pacman -S $(cat packages/pacman_graphical.txt) --noconfirm
else
    echo "invalid choice?"
fi

if [ $choice_hyprland -eq 1 ]
then
    echo "Installing Hyprland"
    pacman -S $(cat packages/hyprland.txt) --noconfirm
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    echo "Installing Paru"
    git clone https://aur.archlinux.org/paru.git ../paru
    cd ../paru
    makepkg -si
    cd ../bash-install
    paru -S $(cat packages/paru.txt)
else
    echo "Not Installing Hyprland"
fi
pacman -S $(cat packages/pacman_framework.txt) --noconfirm
