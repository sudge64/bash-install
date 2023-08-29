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
