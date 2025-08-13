# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Deactivate bell sound
setopt NO_BEEP

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# set editor
EDITOR="nvim"

# my notes folder
export MYNOTES="$HOME/obsidian_linux_vault/linux"


# Functions
mkcd() {
   mkdir -p $1
   cd $1
}

lfcd () {
   cd "$(command lf -print-last-dir $1)"
}

__tmux-sessionizer() {
   ~/dotfiles/scripts/tmux_sessionizer.sh
}

 # Aliases
alias c='clear'
alias ls='ls --color -G'
alias ll='ls --color -lah'
alias la='ls --color -a'
alias vi='nvim'
alias vim='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias l.='ls --color -a | grep ^\..+'
alias please='sudo $(history | head -1)'
alias update='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove' 
alias du="du -h --max-depth=1"
alias fd='fdfind'
alias fcd='cd "$(find . -type d | fzf)"'
alias fvim='vim "$(fzf)"'
alias z='zoxide query'
alias fz='zoxide query --interactive'

alias mynotes='vim "$(find $MYNOTES | fzf)"'
alias myip="ip address | grep 'inet 192.' | awk '{print \$2}'"

# Zle widgets

zle -N __tmux-sessionizer-widget __tmux-sessionizer

# Keybindings

## vim keybindings
bindkey -v

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

## history search
bindkey "^R" history-incremental-search-backward

## sessionizer

bindkey '^f' __tmux-sessionizer-widget


# custom scripts
set PATH $HOME/.local/bin:$PATH

# Shell integrations
eval "$(fzf --zsh)" > /dev/null
eval "$(zoxide init --cmd cd zsh)"

# starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh




# cowsay initial message
fortune-cowsay.sh
