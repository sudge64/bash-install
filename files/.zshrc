# C.J. Wade's .zshrc
# Initially inspired by Chris Titus Tech's old video: https://www.youtube.com/watch?v=gGmBUfMaWMU
# Now with sources and plugins inspired from: https://www.youtube.com/watch?v=ud7YxC33Z3w

# Sources
# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
eval "$(zoxide init zsh)"

# Function for yazi from https://yazi-rs.github.io/docs/quick-start
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# We using ZINIT now! Package manager for zsh.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

source "$HOME/.cargo/env"

# zsh plugins
# Add in powerlevel10k with zinit
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add in zsh-completions
zinit light zsh-users/zsh-completions

# Add in zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Use fzf inside zsh
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEFILE=$HISTFILE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:completion:cd:*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Key bindings
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
bindkey '^f'      autosuggest-accept
bindkey '^p'      history-search-backward
bindkey '^n'      history-search-forward

# Aliases

# Debian update alias
if command -v apt &> /dev/null
then
  alias updateD="sudo apt update -y && sudo apt upgrade -y && flatpak update -y"
fi

# Fedora update aliases
if command -v dnf &> /dev/null
then
  alias upgradeF="sudo dnf upgrade -y && flatpak update -y"
  alias upgradeN="sudo dnf update rpmfusion-nonfree-release rpmfusion-free-release fedora-repos nobara-repos --refresh && sudo dnf distro-sync --refresh && sudo dnf update --refresh && flatpak update -y"
fi

# Arch update alias
# Check if paru is installed
if command -v paru &> /dev/null
then
  alias updateA="paru -Syu --noconfirm && flatpak update -y"
else
  alias updateA="sudo pacman -Syu --noconfirm && flatpak update -y"
fi

if command -v brew &> /dev/null
then
  alias updateM="brew update && brew upgrade"
fi
alias ls="ls --color"
alias ll="ls -lh --color"
alias la="ls -a --color"
alias lal="ls -alh --color"
alias lla="ls -lah --color"
alias ld="ls -ldh --color"
alias nv="nvim"
alias t="tmux"
alias btw="fastfetch --config examples/10"
alias smol="fastfetch --config examples/13"
alias cd="z"
unalias zi
alias cdi="zi"
alias lgc="looking-glass-client -F"

# Exports
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color
export EDITOR='nvim'
if grep -q "SteamOS" /etc/os-release
then
    export SADX="/home/deck/.local/share/Steam/steamapps/common/Sonic Adventure DX"
    export SA2B="/home/deck/.local/share/Steam/steamapps/common/Sonic Adventure 2"
else
    export SADX="/media/cjwade/sandisk2tb/SteamLibrary/steamapps/common/Sonic Adventure DX"
    export SA2B="/media/cjwade/sandisk2tb/SteamLibrary/steamapps/common/Sonic Adventure 2"
fi
