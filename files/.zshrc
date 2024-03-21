# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.cargo/env"

# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^?'      backward-delete-char          # bs         delete one char backward
bindkey '^[[3~'   delete-char                   # delete     delete one char forward
bindkey '^[[5~'   up-line-or-history            # page-up
bindkey '^[[6~'   down-line-or-history          # page-down
bindkey '^[[H'    beginning-of-line             # home       go to the beginning of line
bindkey '^[[F'    end-of-line                   # end        go to the end of line
bindkey '^[[1;5C' forward-word                  # ctrl+right go forward one word
bindkey '^[[1;5D' backward-word                 # ctrl+left  go backward one word
bindkey '^H'      backward-kill-word            # ctrl+bs    delete previous word
bindkey '^[[3;5~' kill-word                     # ctrl+del   delete next word
bindkey '^J'      backward-kill-line            # ctrl+j     delete everything before cursor
bindkey '^[[D'    backward-char                 # left       move cursor one char backward
bindkey '^[[C'    forward-char                  # right      move cursor one char forward

alias updateD="sudo apt update -y && sudo apt upgrade -y && flatpak update -y"
alias upgradeF="sudo dnf upgrade -y && flatpak update -y"
alias upgradeN="sudo dnf update rpmfusion-nonfree-release rpmfusion-free-release fedora-repos nobara-repos --refresh && sudo dnf distro-sync --refresh && sudo dnf update --refresh && flatpak update -y"
alias updateA="sudo pacman -Syu --noconfirm && flatpak update -y"
alias updateM="brew update && brew upgrade"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias lla="ls -la"
alias ld="ls -ld"
alias nv="nvim"
alias t="tmux"
alias p="pacman -S"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color
