#!/bin/bash

# Authored by C.J. Wade
# 07/25/25
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

if [ ! -f /home/$user_name/.config/tmux/tmux.conf ]
then
    echo "Set up tmux"
    sudo -u $user_name mkdir /home/$user_name/.config/tmux
    sudo -u $user_name cp ./files/tmux.conf /home/$user_name/.config/tmux/
    sudo -u $user_name git clone https://github.com/tmux-plugins/tpm /home/$user_name/.config/tmux/plugins/tpm
fi

if [ ! -d /home/$user_name/.vim_runtime ]
then
    echo "Set up The Ultimate vimrc"
    sudo -u $user_name git clone --depth=1 https://github.com/amix/vimrc.git /home/$user_name/.vim_runtime
    sudo -u $user_name sh /home/$user_name/.vim_runtime/install_awesome_vimrc.sh
    sudo -u $user_name mkdir -p /home/$user_name/.vim_runtime/pack/plugins/start
    sudo -u $user_name git clone https://github.com/christoomey/vim-tmux-navigator /home/$user_name/.vim_runtime/pack/plugins/start/vim-tmux-navigator
fi
