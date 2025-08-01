#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

# Set variables for identifing OS type.
release_file=/etc/os-release
hostname=/proc/sys/kernel/hostname

# Check if script is being ran with root.
if [ "$(id -u)" -ne 0 ]
then
    echo "Please run this script as root."
    exit 1
fi

# Controls the amounts of packages to be installed
echo "--Menu--"
echo "1.) Desktop"
echo "2.) Server"
echo "3.) Basic Dev Environment"
echo "4.) Exit"

read -r choice;

case "$choice" in
    1) echo "You have chosen Desktop. Flatpaks will be installed. (Not on macOS)";;
    2) echo "You have chosen Server. Flatpaks will not be installed.";;
    3) echo "You have chosen Basic Dev Environment. Tmux and Vim will be configured."
        source ./basic.sh -u $SUDO_USER
        exit 0;;
    4) echo "Exiting Program."
        exit 0;;
    *) echo "Invalid choice."
        exit 0;;
esac

# Function to check if Desktop or Server has been picked.
function check_choice(){
    if [ $choice -eq 1 ]
    then
        source ./flatpak.sh
    elif [ $choice -eq 2 ]
    then 
        echo "servers do not typically need flatpaks."
    else
        echo "invalid choice?"
    fi
}

source ./dotfiles.sh -u $SUDO_USER
source ./zsh-setup.sh -u $SUDO_USER

# Main if-else block,
# ID's OS, updates packages, and runs the corresponding script.
if grep -q "Fedora" $release_file || grep -q "Amazon" $release_file
then
    dnf upgrade && dnf install wget -y
    source ./fedora.sh -c $choice
    check_choice
elif grep -q "Nobara" $release_file
then
    dnf upgrade && dnf install wget -y
    source ./nobara.sh -c $choice -u $SUDO_USER
    check_choice
elif grep -q "Alpine" $release_file
then
    apk update && apk upgrade && apk add wget
    source ./alpine.sh
    check_choice
elif grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file || grep -q "Pop!_OS" $release_file
then
    apt update && apt upgrade && apt install wget -y
    source ./debian.sh -c $choice
    check_choice
elif grep -q "Arch" $release_file || grep -q "Artix" $release_file
then
    pacman -Syu && pacman -S wget reflector -y

    # Controls the amounts of packages to be installed
    echo "Do you wish to install Hyprland?"
    echo "1.) Yes"
    echo "2.) No"

    read -r choice_hyprland;

    case $choice_hyprland in
        1) echo "Installing Hyprland";;
        2) echo "Not Installing Hyprland";;
        *) echo "Invalid choice."
            exit 0;;
    esac

    if grep -q "steamdeck" $hostname
    then
        source ./steamdeck.sh
    else
        sudo reflector --verbose --country 'United States' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
        source ./arch.sh -c $choice -h $choice_hyprland -u $SUDO_USER

    fi
    check_choice
elif sw_vers -productName | grep "macOS"
then
    source ./macintosh.sh
else
    echo "OS not identified."
fi
