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

if [ ! -d /home/$user_name/.local/share/fonts ]
then
    echo "Make /home/$user_name/.local/share/fonts"
    sudo -u $user_name mkdir /home/$user_name/.local/share/fonts
fi

if [ ! -f /home/$user_name/.local/share/fonts/Meslo* ]
then
    echo "Download Meslo Nerd Font"
    sudo -u $user_name wget -P /home/$user_name/.local/share/fonts/ "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip"
    echo "Unzip Meslo Nerd Font"
    sudo -u $user_name unzip /home/$user_name/.local/share/fonts/Meslo.zip -d /home/$user_name/.local/share/fonts/
    sudo -u $user_name rm /home/$user_name/.local/share/fonts/Meslo.zip
fi

if [ ! -f /home/$user_name/.p10k.zsh ]
then
    echo "Copy .p10k.zsh."
    sudo -u $user_name cp ./files/.p10k.zsh /home/$user_name/
fi

if [ ! -f /home/$user_name/.zshrc ]
then
    echo "Copy .zshrc."
    sudo -u $user_name cp ./files/.zshrc /home/$user_name/
fi

if [ ! -d /home/$user_name/.zsh/zsh-syntax-highlighting ]
then
    echo "Install zsh-syntax-highlighting from GitHub"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$user_name/.zsh/zsh-syntax-highlighting
fi

if [ ! -d /home/$user_name/.zsh/zsh-autosuggestions ]
then
    echo "Install zsh-syntax-highlighting from GitHub"
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/$user_name/.zsh/zsh-autosuggestions
fi

if [ ! -d /home/$user_name/.zsh/powerlevel10k ]
then
    echo "Install powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$user_name/.zsh/powerlevel10k
fi

# if [ ! -f /home/$user_name/.cache/zshhistory ]
# then
    # echo "Touch zshhistory"
    # touch "/home/$user_name/.cache/zshhistory"
# fi
