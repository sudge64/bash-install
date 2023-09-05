#!/bin/bash

# Authored by C.J. Wade
# 06/27/23
# https://cj-wade.com
# https://github.com/sudge64

# Set variables for identifing OS type.
release_file=/etc/os-release
hostname=/proc/sys/kernel/hostname

# Check if script is being ran with root.
if [ $(id -u) -ne 0 ]
then
    echo "Please run this script as root."
    exit 1
fi

# Controls the amounts of packages to be installed
echo "--Menu--"
echo "1.) Desktop"
echo "2.) Server"
echo "3.) Exit"

read -r choice;

case $choice in
    1) echo "You have chosen Desktop. Flatpaks will be installed. (Not on macOS)";;
    2) echo "You have chosen Server. Flatpaks will not be installed.";;
    3) echo "Exiting Program."
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
if grep -q "Fedora" $release_file || grep -q "Nobara" $release_file
then
    dnf upgrade && dnf install wget -y
    if grep -q "Nobara" $release_file
    then
        sudo dconf load / < ./files/nobara.dconf
    fi
    source ./fedora.sh -c $choice
    check_choice
elif grep -q "Alpine" $release_file
then
    apk update && apk upgrade && apk add wget
    source ./alpine.sh
    check_choice
elif grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file || grep -q "Pop!_OS" $release_file
then
    apt update && apt upgrade && apt install wget -y
    if grep -q "Pop" $release_file
    then
        sudo dconf load / < ./files/settings.dconf
    fi
    if grep -q "openmediavault" $hostname
    then
        source ./omv.sh
    else
        source ./debian.sh -c $choice

    fi
    check_choice
elif grep -q "Arch" $release_file
then
    pacman -Syu && pacman -S wget -y
    if grep -q "steamdeck" $hostname
    then
        source ./steamdeck.sh
    else
        source ./arch.sh -c $choice

    fi
    check_choice
elif echo $(sw_vers -productName) | grep "macOS"
then
    source ./macintosh.sh
else
    echo "OS not identified."
fi
